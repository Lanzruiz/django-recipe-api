"""
Sample tests
"""

from django.test import SimpleTestCase

from app import calc


class CalcTests(SimpleTestCase):
    """Test the calc module."""

    def test_add_numbers(self):
        """Test adding number together."""

        res = calc.add(5, 6)
        self.assertEqual(res, 11)

    def test_subract_numbers(self):

        res = calc.subtrack(6, 5)
        self.assertEqual(res, 1)