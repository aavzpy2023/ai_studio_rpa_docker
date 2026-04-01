from collections.abc import Mapping
from difflib import SequenceMatcher
from typing import TypeVar

T = TypeVar("T")


class FuzzyMatcher:
    """
    Domain-agnostic utility for fuzzy string matching using SequenceMatcher.
    """

    @staticmethod
    def match(
        query: str, choices: Mapping[str, T], threshold: float = 0.75
    ) -> tuple[T | None, bool]:
        """
        Finds the best match for 'query' in the keys of 'choices'.

        Args:
            query: The string to search for.
            choices: A dictionary mapping search strings (lowercase) to values
                (IDs/Entities).
            threshold: Similarity threshold (0.0 to 1.0).

        Returns:
            tuple[Value | None, bool]: (Matched Value, Is Exact Match?)
            If no match exceeds threshold, returns (None, False).
        """
        if not query or not choices:
            return None, False

        clean_query = query.strip().lower()

        # 1. Exact Match (O(1))
        if clean_query in choices:
            return choices[clean_query], True

        # 2. Fuzzy Match (O(N))
        best_ratio = 0.0
        best_key = None

        for key in choices.keys():
            ratio = SequenceMatcher(None, clean_query, key).ratio()
            if ratio > best_ratio:
                best_ratio = ratio
                best_key = key

        if best_ratio > threshold and best_key is not None:
            return choices[best_key], False

        return None, False
