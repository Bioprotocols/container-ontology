from setuptools import setup, find_packages  # noqa: H301

NAME = "container-ontology"
VERSION = "1.0.0"
# To install the library, run the following
#
# python setup.py install
#
# prerequisite: setuptools
# http://pypi.python.org/pypi/setuptools

REQUIRES = [
    "rdflib",
  "urllib3 >= 1.25.3",
  "python-dateutil",
]

setup(
    name=NAME,
    version=VERSION,
    description="SD2E Container Ontology for PAML",
    author="Robert P. Goldman",
    author_email="rpgoldman@sift.net",
    url="https://github.com/rpgoldman/container-ontology",
    python_requires=">=3.6",
    install_requires=REQUIRES,
    packages=find_packages(["src", "owlery_client"], exclude=["test", "tests"]),
    include_package_data=True,
    license="MIT",
    # long_description="""\
    # Owlery provides a web API for an [OWL API](http://owlapi.sourceforge.net)-based reasoner containing a configurable set of ontologies (a \&quot;knowledgebase\&quot;).   # noqa: E501
    # """
)
