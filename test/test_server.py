import os
import time
from typing import Dict

import docker
import requests
from requests import HTTPError

OWL_DIR = os.path.abspath(os.path.join(os.path.dirname(__file__), '../owl'))


def test_server_start(reg=None, tag='latest', log_file="/logs/composition.log"):

    print("REG: " + str(reg))
    print("TAG: " + str(tag))

    client = docker.from_env()
    if reg is not None:
        container_string = f"{reg}/rpgoldman/owlery:{tag}"
    else:
        container_string = f"rpgoldman/owlery:{tag}"
    print(f"Trying to start {container_string}")

    try:
        image = client.images.get(container_string)
    except docker.errors.ImageNotFound:
        image = client.images.pull(container_string)
    assert isinstance(image, docker.models.images.Image)

    docker_env: Dict[str, str] = {
        "JAVA_OPTS": '-Dorg.slf4j.simpleLogger.defaultLogLevel=DEBUG -Dlogback.configurationFile=/srv/conf/logback.xml',
    }

    #logdir = '/tmp/owlery-logs'
    #os.makedirs(logdir, exist_ok=True)
    # $(makeFileDir)/server-files:/srv/owl -v $(makeFileDir)owlery-conf:/srv/conf rpgoldman/owlery:latest
    server_volumes = {os.path.join(OWL_DIR, 'server-files'): {'bind': '/srv/owl', 'mode': 'rw'},
                      os.path.join(OWL_DIR, 'owlery-conf'): {'bind': '/srv/conf', 'mode': 'rw'},
                      }

    print(f"Docker environment is: {docker_env}; mounting map is {server_volumes}")
    
    container = client.containers.run(
        container_string,
        detach=True,
        remove=True,
        # privileged=True,
        ports={8080: 8080},
        environment=docker_env,
        volumes=server_volumes
    )
    assert isinstance(container, docker.models.containers.Container)
    print(f"Started container {container}")

    try:
        success = False
        for i in range(30):
            try:
                kb_list = requests.get(
                    "http://localhost:8080/kbs"
                )
                # version_response = requests.get(
                #     "http://localhost:8080/api/v3/version"
                # )
                assert kb_list.status_code == 200, "Unexpected response from server: status = %d"%kb_list.status_code
                success = True
                break
            except requests.exceptions.ConnectionError:
                print("Request timed out...trying again")
                time.sleep(5)

        assert success, "Timed out after 30 attempts to test the status and version endpoints against our container."
        assert kb_list.json() == ['sd2e-container-catalogs']
        print("Successful test!!!")
        #assert status_response.status_code == 200, f"Testing status endpoint, got HTTP status code {status_response.status_code} with message {status_response.text}"
        #assert version_response.status_code == 200, f"Testing version endpoint, got HTTP status code {version_response.status_code} with message {version_response.text}"
        #assert s.validate_schema(status_response.json(), "Status")
        #assert s.validate_schema(version_response.json(), "Version")

        #assert len(examples) == 1, f"Expected one example input. Got {len(examples)}"
        # for example in examples:
        #     with open(example, "r") as file:
        #         TEST_INPUT = json.load(file)
        #
        #         query_string = {"max_responses": 56}
        #
        #         success = False
        #
        #         for i in range(30):
        #             try:
        #                 orch_response = requests.post(
        #                     "http://localhost:8080/api/v3/compositions",
        #                     data=json.dumps(TEST_INPUT),
        #                     params=query_string,
        #                     headers={"Content-Type": "application/json"},
        #                 )
        #                 success = True
        #                 break
        #             except requests.exceptions.ConnectionError:
        #                 if i <= 23:
        #                     print("Request timed out...trying again")
        #                 else:
        #                     print("Giving up")
        #                 time.sleep(5)
        #
        #     assert success, "Timed out after 30 attempts to run the test against our container."
        #
        #     assert orch_response.status_code == 200, f"Processing {os.path.basename(example)}, got status code {orch_response.status_code} with message {orch_response.text}"
        #
        #     assert s.validate_schema(orch_response.json(), "Plan")
        #     print("COMPOSITION\n")
        #     print (orch_response.json()['workflow'])

            # if (test_exec):
            #     # [mpelican:20201022.1548CDT] DEPRECATED: detects syntax errors, but not much more.
            #     # Try to exec first composition.
            #     #print(f"attempting exec of {orch_response.json()[0]['python']}")
            #     #exec(orch_response.json()[0]['python'])

            #     # write to file
            #     plan_file = tempfile.NamedTemporaryFile(prefix='logxplan', suffix='.py')
            #     plan_file.write(orch_response.json()[0]['python'].encode())
            #     plan_file.flush()
            #     subprocess.run(['python', plan_file.name], check=True)

    finally:
        try:
            container.stop()
        except HTTPError:
            pass
        except docker.errors.APIError:
            pass


if __name__ == '__main__':
    test_server_start()