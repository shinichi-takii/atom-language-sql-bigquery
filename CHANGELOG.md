# Changelog

## 0.2.4
1. Add supports new function 'GENERATE_TIMESTAMP_ARRAY', 'FROM_BASE32' and 'TO_BASE32'
    - GENERATE_TIMESTAMP_ARRAY
        - Function  
          `GENERATE_TIMESTAMP_ARRAY(start_timestamp, end_timestamp, INTERVAL step_expression date_part)`
        - Snippet  
          `generate_timestamp_array` -> `GENERATE_TIMESTAMP_ARRAY(start_timestamp, end_timestamp, INTERVAL step_expression date_part)`
        - Document  
          https://cloud.google.com/bigquery/docs/reference/standard-sql/functions-and-operators#generate_timestamp_array

    - FROM_BASE32
        - Function  
          `FROM_BASE32(string_expr)`
        - Snippet  
          `from_base32` -> `FROM_BASE32(string_expr)`
        - Document  
          https://cloud.google.com/bigquery/docs/reference/standard-sql/functions-and-operators#from_base32

    - TO_BASE32
        - Function  
          `TO_BASE32(bytes_expr)`
        - Snippet  
          `to_base32` -> `TO_BASE32(bytes_expr)`
        - Document  
          https://cloud.google.com/bigquery/docs/reference/standard-sql/functions-and-operators#to_base32

2. Add supports 'clustered tables'
    - Enhancement snippets
        - `create table partition` (`CREATE TABLE ... PARTITION BY`)

    - Add snippets
        - `clusterby` -> `CLUSTER BY clustering_column_list`

3. Add DDL options 'kms_key_name', 'friendly_name'
    - Add snippets to DDL options
      - `kms_key_name`
      - `friendly_name`

    - Document  
      https://cloud.google.com/bigquery/docs/reference/standard-sql/data-definition-language#table_option_list

4. Miner fix

## 0.2.3
1. Add support 'NUMERIC' data type
    - BigQuery added support for `NUMERIC` data type on May 15, 2018.

2. Add snippet of part EXTRACT function
    - Date EXTRACT
        - `dayofweek` -> `EXTRACT(DAYOFWEEK FROM date_expression)`
        - `dayofyear` -> `EXTRACT(DAYOFYEAR FROM date_expression)`
        - `week` -> `EXTRACT(WEEK FROM date_expression)`
        - `weekday` -> `EXTRACT(WEEK(<WEEKDAY>) FROM date_expression)`
        - `isoweek` -> `EXTRACT(ISOWEEK FROM date_expression)`
        - `quarter` -> `EXTRACT(QUARTER FROM date_expression)`
        - `isoyear` -> `EXTRACT(ISOYEAR FROM date_expression)`

    - Timestamp EXTRACT
        - `microsecond` -> `EXTRACT(MICROSECOND FROM timestamp_expression [AT TIME ZONE tz_spec])`
        - `millisecond` -> `EXTRACT(MILLISECOND FROM timestamp_expression [AT TIME ZONE tz_spec])`
        - `second` -> `EXTRACT(SECOND FROM timestamp_expression [AT TIME ZONE tz_spec])`
        - `minute` -> `EXTRACT(MINUTE FROM timestamp_expression [AT TIME ZONE tz_spec])`
        - `hour` -> `EXTRACT(HOUR FROM timestamp_expression [AT TIME ZONE tz_spec])`

3. Miner fix

## 0.2.2
1. Add new function 'ERROR'

    - Function  
      `ERROR(error_message)`
    - Snippet  
      `error` -> `ERROR(error_message)`
    - Document  
      https://cloud.google.com/bigquery/docs/reference/standard-sql/functions-and-operators#error

2. Add new function 'SAFE.prefix'

    - Function  
      `SAFE.function_name()`
    - Snippet  
      `safeprefix` -> `SAFE.function_name()`
    - Document  
      https://cloud.google.com/bigquery/docs/reference/standard-sql/functions-and-operators#safe-prefix

3. Add snippet CTAS  
  BigQuery data definition language supports creating a table from the result of a query.

    - Snippet
        - Prefix  
          `create table as select`
        - body  
          ```sql
          CREATE TABLE `project.dataset.table`
          (
            column type
          ) AS
          SELECT
            column
          FROM `project.dataset.table`
          WHERE condition
          ```
    - Document  
      https://cloud.google.com/bigquery/docs/data-definition-language

4. Add snippet 'CREATE TABLE OPTIONS'

    - Snippet
        - Prefix
              - `create table options`
              - `options`
        - body
          ```sql
          OPTIONS (
            description = "description",
            expiration_timestamp = TIMESTAMP "YYYY-MM-DD HH:MI:SS UTC",
            partition_expiration_days = 1,
            require_partition_filter = false,
            labels = [("key", "value")]
          )
          ```
    - Document  
      https://cloud.google.com/bigquery/docs/data-definition-language#options_clause

5. Add new statement 'MERGE'  
  BigQuery support for DML MERGE statements.

    - Syntax
      ```sql
      MERGE [INTO] target_name [[AS] alias]
      USING source_name
      ON merge_condition
      { when_clause }
      ```
    - Snippet
        - Prefix
          `merge`
        - body
          ```sql
          MERGE INTO target_name t
          USING source_name s
          ON merge_condition
          WHEN MATCHED THEN
            UPDATE SET target_column = value
          WHEN NOT MATCHED THEN
            INSERT (target_column, ...) VALUES(source_column, ...)
          ```
    - Document  
      https://cloud.google.com/bigquery/docs/reference/standard-sql/dml-syntax#merge_statement

6. Miner fix

## 0.2.1
- Add snippets.
  - `split` -> `SPLIT(value[, delimiter])`
  - `year` -> `EXTRACT(YEAR FROM date_expression)`
  - `month` -> `EXTRACT(MONTH FROM date_expression)`
  - `day` -> `EXTRACT(DAY FROM date_expression)`

## 0.2.0
- Create snippets.
- Minor fixes.

## 0.1.5
- Support partition decorator.
- Fix regexps content attribute.

## 0.1.4
- Support for delete statement of tablename highlight.
  - Add `DELETE FROM <tablename>` highlight regrexp.

## 0.1.3
- Fix table name regexp.

## 0.1.2
- Fix GCP Project ID regexp.

## 0.1.1
- Initial released.
