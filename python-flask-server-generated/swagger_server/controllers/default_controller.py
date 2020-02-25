import connexion
import six

from swagger_server.models.table import Table  # noqa: E501
from swagger_server.models.table_name import TableName  # noqa: E501
from swagger_server.models.tables import Tables  # noqa: E501
from swagger_server import util


def table_get(body_limit=None, page_limit=None):  # noqa: E501
    """all tables in MDH

    get the title of all tables that exist in MDH # noqa: E501

    :param body_limit: The amount of tables returned
    :type body_limit: int
    :param page_limit: The pages to return table info
    :type page_limit: int

    :rtype: Tables
    """
    return 'do some magic!'


def table_id_get(id):  # noqa: E501
    """table_id_get

    Obtain information about specific table # noqa: E501

    :param id: The ID of the table
    :type id: int

    :rtype: Table
    """
    return 'do some magic!'


def table_post(body):  # noqa: E501
    """table_post

    Creates a new table in MDH # noqa: E501

    :param body: 
    :type body: dict | bytes

    :rtype: None
    """
    if connexion.request.is_json:
        body = TableName.from_dict(connexion.request.get_json())  # noqa: E501
    return 'do some magic!'
