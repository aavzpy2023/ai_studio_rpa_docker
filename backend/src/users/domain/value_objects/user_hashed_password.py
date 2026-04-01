from dataclasses import dataclass


@dataclass(frozen=True)
class HashedPassword:
    """
    Value Object representing a password that has already been processed
    by a cryptographic hashing algorithm (e.g., Bcrypt).

    Invariants:
    - Must not be empty.
    - Does NOT enforce complexity  rules (complexity is for plaintext only).
    """

    value: str

    def __post_init__(self) -> None:
        self._validate()

    def _validate(self) -> None:
        """
        Validates basic integrity of the hashed string.
        """
        if not self.value or len(self.value) < 20:
            # Most secure hashes (Bcrypt, Argon2) are significantly longer than
            # 20 chars.
            raise ValueError("Invalid hashed password format.")

    @classmethod
    def from_string(cls, value: str) -> "HashedPassword":
        """Factory method for semantic instantiation."""
        return cls(value=value)
