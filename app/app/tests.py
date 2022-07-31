"""
Sample Test
"""

from django.test import SimpleTestCase
from app import calc


class CaclTest(SimpleTestCase):
    """ Test the calc module """

    def test_add_numbers(self):
        """ Test adding the numbers """
        res = calc.add(5, 6)

        self.assertEqual(res, 11)

    def test_subtract_numbers(self):
        """ Test subtract the numbers """

        res = calc.subtract(5, 2)

        self.assertEqual(res, 3)
