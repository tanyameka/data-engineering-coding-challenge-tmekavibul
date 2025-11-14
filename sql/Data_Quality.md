Issues Identified:
1. Header Row Loaded as Data
    * The first row in each source table contains column names instead of actual records, likely due to CSVs being loaded without SKIP_HEADER=1.
2. Missing Values / Nulls
    * Columns contain true NULLs, or literal strings like "NULL" 
    * Some numeric fields that should default to 0 are represented as NULL.
3. Duplicate Records
    * Exact duplicate rows exist, also verified by checking potential duplicates in primary key columns.
    * Primary key duplication would break joins and downstream analytics, while exact duplicates indicate ingestion errors.
4. Inconsistent Date Formats
    * Dates appear in multiple formats, requires parsing into a single canonical date format.
5. Data Type Issues
    * Numeric values are stored as strings instead of integers or decimals and have literal NULL strings.
6. Inconsistent String Formatting
    * Emails and phone numbers are in various formats 

Planned Cleaning:
1. Remove header rows before further transformations.
2. Convert empty strings, literal "NULL" to true NULLs, and replace NULLs with 0 where appropriate.
3. Enforce primary key uniqueness and remove duplicates.
4. Parse dates into a single format for consistency.
5. Convert numeric strings to proper integer / decimal types.
6. Standardize string formats, lowercase emails and clean phone numbers to digits only
