# Changelog

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
