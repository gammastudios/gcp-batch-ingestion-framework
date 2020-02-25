# coding: utf-8

import sys
from setuptools import setup, find_packages

NAME = "swagger_server"
VERSION = "1.0.0"
# To install the library, run the following
#
# python setup.py install
#
# prerequisite: setuptools
# http://pypi.python.org/pypi/setuptools

REQUIRES = ["connexion"]

setup(
    name=NAME,
    version=VERSION,
    description="MDH",
    author_email="",
    url="",
    keywords=["Swagger", "MDH"],
    install_requires=REQUIRES,
    packages=find_packages(),
    package_data={'': ['swagger/swagger.yaml']},
    include_package_data=True,
    entry_points={
        'console_scripts': ['swagger_server=swagger_server.__main__:main']},
    long_description="""\
    Metadata Hub (MDH) is intended to be the source of truth for metadata around the Funds Data Solution (FDS) platform. It has the ability to load metadata configuration from yaml, and serve that information up via API, and will also be the store of information for pipeline information while ingesting files into the platform 
    """
)
