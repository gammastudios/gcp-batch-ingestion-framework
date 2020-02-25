# coding: utf-8

from __future__ import absolute_import

from flask import json
from six import BytesIO

from swagger_server.models.table import Table  # noqa: E501
from swagger_server.models.table_name import TableName  # noqa: E501
from swagger_server.models.tables import Tables  # noqa: E501
from swagger_server.test import BaseTestCase


class TestDefaultController(BaseTestCase):
    """DefaultController integration test stubs"""

    def test_table_get(self):
        """Test case for table_get

        all tables in MDH
        """
        query_string = [('body_limit', 20),
                        ('page_limit', 5)]
        response = self.client.open(
            '/v1/table',
            method='GET',
            query_string=query_string)
        self.assert200(response,
                       'Response body is : ' + response.data.decode('utf-8'))

    def test_table_id_get(self):
        """Test case for table_id_get

        
        """
        response = self.client.open(
            '/v1/table/{id}'.format(id=56),
            method='GET')
        self.assert200(response,
                       'Response body is : ' + response.data.decode('utf-8'))

    def test_table_post(self):
        """Test case for table_post

        
        """
        body = TableName()
        response = self.client.open(
            '/v1/table',
            method='POST',
            data=json.dumps(body),
            content_type='application/json')
        self.assert200(response,
                       'Response body is : ' + response.data.decode('utf-8'))


if __name__ == '__main__':
    import unittest
    unittest.main()
