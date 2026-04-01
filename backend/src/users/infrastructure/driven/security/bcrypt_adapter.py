import bcrypt

from users.domain.services.security_services import HashingService


class BcryptAdapter(HashingService):
    """
    Bcrypt-based implementation of the HashingService interface.

    This adapter provides secure password hashing using the bcrypt algorithm,
    which is specifically designed for password hashing with built-in salt generation
    and configurable computational cost.

    Bcrypt advantages:
    - Automatically generates random salts
    - Resistant to rainbow table attacks
    - Adjustable work factor (cost) to remain secure as hardware improves
    - Industry-standard for password security

    Default Configuration:
    - Uses 12 rounds (2^12 iterations), considered secure for most applications
    - Automatically includes salt in the hash output
    - Compatible with standard bcrypt hash format ($2b$12$...)
    """

    def hash(self, plain_password: str) -> str:
        """
        Hash a plaintext password using bcrypt with automatic salt generation.

        The method performs the following steps:
        1. Converts the password string to bytes (required by bcrypt)
        2. Generates a random salt with default 12 rounds
        3. Hashes the password with the salt
        4. Returns the hash as a UTF-8 string for database storage

        The resulting hash contains the salt and cost factor, making it
        self-contained and suitable for verification.

        Args:
            plain_password: The plaintext password to hash.

        Returns:
            A bcrypt hash string in the format $2b$12$[salt][hash],
            suitable for database storage.

        Example:
            >>> adapter = BcryptAdapter()
            >>> hash_result = adapter.hash("MySecurePass123!")
            >>> print(hash_result)
            '$2b$12$EixZaYVK1fsbw1ZfbX3OXe...' (60 characters)
        """
        # 1. Convert string to bytes (bcrypt requirement)
        pwd_bytes = plain_password.encode("utf-8")

        # 2. Generate salt and hash password
        # gensalt() uses 12 rounds by default (recommended security level)
        # Higher rounds = more secure but slower (each increment doubles time)
        salt = bcrypt.gensalt()
        hashed_bytes = bcrypt.hashpw(pwd_bytes, salt)

        # 3. Convert hash bytes back to string for database storage
        return hashed_bytes.decode("utf-8")

    def verify(self, plain_password: str, hashed_password: str) -> bool:
        """
        Verify if a plaintext password matches a bcrypt hash.

        This method securely compares a plaintext password against a stored
        bcrypt hash. Bcrypt automatically extracts the salt from the hash,
        so no separate salt storage is needed.

        The verification is timing-safe to prevent timing attacks.

        Args:
            plain_password: The plaintext password to verify.
            hashed_password: The bcrypt hash to compare against (from database).

        Returns:
            True if the password matches the hash, False otherwise.
            Also returns False if any error occurs during verification
            (security-first approach: deny on error).

        Example:
            >>> adapter = BcryptAdapter()
            >>> stored_hash = adapter.hash("MyPassword123!")
            >>> adapter.verify("MyPassword123!", stored_hash)
            True
            >>> adapter.verify("WrongPassword", stored_hash)
            False
        """
        try:
            # Convert both inputs to bytes (bcrypt requirement)
            pwd_bytes = plain_password.encode("utf-8")
            hash_bytes = hashed_password.encode("utf-8")

            # Verify password against hash
            # checkpw automatically extracts the salt from the hash
            return bcrypt.checkpw(pwd_bytes, hash_bytes)
        except Exception:
            # Security-first approach: any error (encoding, format, etc.)
            # results in verification failure rather than raising an exception
            # This prevents information leakage about the error type
            return False
