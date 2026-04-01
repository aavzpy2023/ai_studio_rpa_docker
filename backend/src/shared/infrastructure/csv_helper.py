import io
from collections.abc import Generator
from typing import Any

import pandas as pd  # type: ignore[import-untyped]


class SpreadsheetParser:
    """
    Infrastructure utility to handle CSV and Excel stream decoding and parsing.
    """

    @staticmethod
    def read_rows(file_stream: bytes, filename: str) -> Generator[dict[str, Any]]:
        """
        Decodes a byte stream (CSV or XLSX) and yields dictionaries for each row.
        """
        is_excel = filename.lower().endswith((".xlsx", ".xls"))

        if is_excel:
            sheets_dict = pd.read_excel(
                io.BytesIO(file_stream), sheet_name=None, engine="openpyxl", dtype=str
            )
            df = pd.concat(sheets_dict.values(), ignore_index=True)
        else:
            try:
                content = file_stream.decode("utf-8-sig")
            except UnicodeDecodeError:
                content = file_stream.decode("latin-1")

            first_line = content.split("\n")[0]
            delimiter = (
                "\t" if "\t" in first_line else ";" if ";" in first_line else ","
            )

            df = pd.read_csv(io.StringIO(content), sep=delimiter, dtype=str)

        df.columns = [str(col).strip().upper() for col in df.columns]
        df = df.dropna(how="all")
        df = df.fillna("")

        for _, row in df.iterrows():
            yield row.to_dict()
