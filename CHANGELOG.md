# Changelog

## [1.3.0] - 2019-07-14
### Added
- Add BigQuery ML supports the `DROP MODEL` DDL statement for deleting models.

### Changed
- Add description option to `CREATE TABLE` statements.
  - Example
    - Prefix  
      `create table`
    - Body
      - old
        ```sql
        CREATE TABLE `project.dataset.table`
        (
          column type
        )
        ```
      - new
        ```sql
        CREATE TABLE `project.dataset.table`
        (
          column type OPTIONS (description = "comment")
        )
        ```


## [1.2.0] - 2019-04-21
1. Add supports AEAD encryption functions
    - Supported syntax highlighting
    - Added snippets
    - Document  
      https://cloud.google.com/bigquery/docs/reference/standard-sql/aead_encryption_functions
    - Functions

      |Function Name|Prefix|Body|
      |:--|:--|:--|
      |`KEYS.NEW_KEYSET`|`keysnew_keyset`|`KEYS.NEW_KEYSET(key_type)`|
      |`KEYS.ADD_KEY_FROM_RAW_BYTES`|`keysadd_key_from_raw_bytes`|`KEYS.ADD_KEY_FROM_RAW_BYTES(keyset, key_type, raw_key_bytes)`|
      |`AEAD.DECRYPT_BYTES`|`aeaddecrypt_bytes`|`AEAD.DECRYPT_BYTES(keyset, ciphertext, additional_data)`|
      |`AEAD.DECRYPT_STRING`|`aeaddecrypt_string`|`AEAD.DECRYPT_STRING(keyset, ciphertext, additional_data)`|
      |`AEAD.ENCRYPT`|`aeadencrypt`|`AEAD.ENCRYPT(keyset, plaintext, additional_data)`|
      |`KEYS.KEYSET_FROM_JSON`|`keyskeyset_from_json`|`KEYS.KEYSET_FROM_JSON(json_keyset)`|
      |`KEYS.KEYSET_TO_JSON`|`keyskeyset_to_json`|`KEYS.KEYSET_TO_JSON(keyset)`|
      |`KEYS.ROTATE_KEYSET`|`keysrotate_keyset`|`KEYS.ROTATE_KEYSET(keyset, key_type)`|

2. Miner fixed


## [1.1.0] - 2019-02-17
1. Added supports `_TABLE_SUFFIX`
    - Snippet
        - Prefix
            - `_table_suffix`
            - `table_suffix`
        - Body
          ```sql
          _TABLE_SUFFIX BETWEEN "${1:from}" AND "${2:to}"
          ```
    - Document  
      https://cloud.google.com/bigquery/docs/querying-wildcard-tables

2. Added supports `ALTER TABLE SET OPTIONS` statement
    - Snippet - `ALTER TABLE SET OPTIONS`
        - Prefix  
          `altertable`
        - Body
          ```sql
          ALTER TABLE `${1:project}.${2:dataset}.${3:table}`
          SET OPTIONS (
            description = "description",
            expiration_timestamp = TIMESTAMP "YYYY-MM-DD HH:MI:SS UTC",
            partition_expiration_days = 1,
            require_partition_filter = false,
            kms_key_name = "projects/[PROJECT_ID]/locations/[LOCATION]/keyRings/[KEYRING]/cryptoKeys/[KEY]",
            friendly_name = "friendly_name",
            labels = [("key", "value")]
          )
          ```
    - Snippet - `ALTER TABLE IF EXISTS SET OPTIONS`
        - Prefix  
          `altertableifexists`
        - Body
          ```sql
          ALTER TABLE IF EXISTS `${1:project}.${2:dataset}.${3:table}`
          SET OPTIONS (
            description = "description",
            expiration_timestamp = TIMESTAMP "YYYY-MM-DD HH:MI:SS UTC",
            partition_expiration_days = 1,
            require_partition_filter = false,
            kms_key_name = "projects/[PROJECT_ID]/locations/[LOCATION]/keyRings/[KEYRING]/cryptoKeys/[KEY]",
            friendly_name = "friendly_name",
            labels = [("key", "value")]
          )
          ```
    - Document  
      https://cloud.google.com/bigquery/docs/reference/standard-sql/data-definition-language#alter_table_set_options_statement

3. Added supports `ALTER VIEW SET OPTIONS` statement
    - Snippet - `ALTER VIEW SET OPTIONS`
        - Prefix  
          `alterview`
        - Body
          ```sql
          ALTER VIEW `${1:project}.${2:dataset}.${3:view}`
          SET OPTIONS (
            description = "description",
            expiration_timestamp = TIMESTAMP "YYYY-MM-DD HH:MI:SS UTC",
            friendly_name = "friendly_name",
            labels = [("key", "value")]
          )
          ```
    - Snippet - `ALTER VIEW IF EXISTS SET OPTIONS`
        - Prefix  
          `alterviewifexists`
        - Body
          ```sql
          ALTER VIEW IF EXISTS `${1:project}.${2:dataset}.${3:view}`
          SET OPTIONS (
            description = "description",
            expiration_timestamp = TIMESTAMP "YYYY-MM-DD HH:MI:SS UTC",
            friendly_name = "friendly_name",
            labels = [("key", "value")]
          )
          ```
    - Document  
      https://cloud.google.com/bigquery/docs/reference/standard-sql/data-definition-language#alter_view_set_options_statement

4. Added supports `INFORMATION_SCHEMA` views
    - Document  
      https://cloud.google.com/bigquery/docs/information-schema-intro

    - Added snippets view names

      |Prefix|Body|
      |:--|:--|
      |`informationschemata`|`INFORMATION_SCHEMA.SCHEMATA`|
      |`informationschemataoptions`|`INFORMATION_SCHEMA.SCHEMATA_OPTIONS`|
      |`informationtables`|`INFORMATION_SCHEMA.TABLES`|
      |`informationtableoptions`|`INFORMATION_SCHEMA.TABLE_OPTIONS`|
      |`informationcolumns`|`INFORMATION_SCHEMA.COLUMNS`|
      |`informationviews`|`INFORMATION_SCHEMA.VIEWS`|

    - Added snippets view sql
      - `SELECT ... FROM INFORMATION_SCHEMA.SCHEMATA`
        - Prefix  
          `selectinformationschemata`
        - Body
          ```sql
          SELECT
            catalog_name,
            schema_name,
            schema_owner,
            creation_time,
            last_modified_time,
            location
          FROM
            `project.INFORMATION_SCHEMA.SCHEMATA`
          ORDER BY
            schema_name
          ```
      - `SELECT ... FROM INFORMATION_SCHEMA.SCHEMATA_OPTIONS`
        - Prefix  
          `selectinformationschemataoptions`
        - Body
          ```sql
          SELECT
            catalog_name,
            schema_name,
            option_name,
            option_type,
            option_value
          FROM
            `project.INFORMATION_SCHEMA.SCHEMATA_OPTIONS`
          ORDER BY
            schema_name, option_name
          ```
      - `SELECT ... FROM INFORMATION_SCHEMA.TABLES`
        - Prefix  
          `selectinformationtables`
        - Body
          ```sql
          SELECT
            table_catalog,
            table_schema,
            table_name,
            table_type,
            is_insertable_into,
            is_typed,
            creation_time
          FROM
            `project.${2:dataset}.INFORMATION_SCHEMA.TABLES`
          ORDER BY
            table_name
          ```
      - `SELECT ... FROM INFORMATION_SCHEMA.TABLE_OPTIONS`
        - Prefix  
          `selectinformationtableoptions`
        - Body
          ```sql
          SELECT
            table_catalog,
            table_schema,
            table_name,
            option_name,
            option_type,
            option_value
          FROM
            `project.dataset.INFORMATION_SCHEMA.TABLE_OPTIONS`
          ORDER BY
            table_name, option_name
          ```
      - `SELECT ... FROM INFORMATION_SCHEMA.COLUMNS`
        - Prefix  
          `selectinformationcolumns`
        - Body
          ```sql
          SELECT
            table_catalog,
            table_schema,
            table_name,
            column_name,
            ordinal_position,
            is_nullable,
            data_type,
            is_generated,
            generation_expression,
            is_stored,
            is_hidden,
            is_updatable,
            is_system_defined,
            is_partitioning_column,
            clustering_ordinal_position
          FROM
            `project.dataset.INFORMATION_SCHEMA.COLUMNS`
          ORDER BY
            table_name, ordinal_position
          ```
      - `SELECT ... FROM INFORMATION_SCHEMA.VIEWS`
        - Prefix  
          `selectinformationviews`
        - Body
          ```sql
          SELECT
            table_catalog,
            table_schema,
            table_name,
            view_definition,
            check_option,
            use_standard_sql
          FROM
            `project.dataset.INFORMATION_SCHEMA.VIEWS`
          ORDER BY
            table_name
          ```


## [1.0.0] - 2019-01-01
1. Added supports new function `ML.PREDICT`
  - Supported syntax highlighting
  - Added snippets of `ML.PREDICT` function
      - Prefix  
        `mlpredict`
      - Body
        ```sql
        ML.PREDICT(MODEL `project.dataset.model`,
          {TABLE table_name | (query_statement)},
          [STRUCT(<threshold FLOAT64> AS threshold)])
        ```
      - Document  
        https://cloud.google.com/bigquery/docs/reference/standard-sql/bigqueryml-syntax-predict
  - BigQuery release notes
    - [December 13, 2018](https://cloud.google.com/bigquery/docs/release-notes#december_13_2018)

2. Added supports `ML.PREDICT` function standardization parameter
  - Snippet supports to addition of standardization parameter.
    - Prefix  
      `mlpredict`
    - Body
      - old
        ```sql
        ML.WEIGHTS(MODEL `project.dataset.model`)
        ```
      - new
        ```sql
        ML.WEIGHTS(MODEL `project.dataset.model`,
          [STRUCT(<T> AS standardize)])
        ```
    - Document  
      https://cloud.google.com/bigquery/docs/reference/standard-sql/bigqueryml-syntax-weights
  - BigQuery release notes
    - [December 13, 2018](https://cloud.google.com/bigquery/docs/release-notes#december_13_2018)

3. Fix syntax highlighting of strings


## [0.2.8] - 2018-09-15
1. Added supports 'BigQuery ML' functions
    - Supported syntax highlighting
    - Added snippets of `ML.CONFUSION_MATRIX` function
        - Prefix  
          `mlconfusionmatrix`
        - Body
          ```sql
          ML.CONFUSION_MATRIX(MODEL `project.dataset.model`,
            {TABLE table_name | (query_statement)},
            [STRUCT( AS threshold)])
          ```
        - Document  
          https://cloud.google.com/bigquery/docs/reference/standard-sql/bigqueryml-syntax-confusion

2. Added supports Geography functions
    - Supported syntax highlighting
    - Added snippets
    - Document  
      https://cloud.google.com/bigquery/docs/reference/standard-sql/geography_functions
    - Functions

      |Function Name|Prefix|Body|
      |:--|:--|:--|
      |`ST_GEOGPOINT`|`stgeogpoint`|`ST_GEOGPOINT(longitude, latitude)`|
      |`ST_MAKELINE`|`stmakeline`|`ST_MAKELINE({geography_1, geography_2 | array_of_geography})`|
      |`ST_MAKEPOLYGON`|`stmakepolygon`|`ST_MAKEPOLYGON(geography_expression[, array_of_geography])`|
      |`ST_MAKEPOLYGONORIENTED`|`stmakepolygonoriented`|`ST_MAKEPOLYGONORIENTED(array_of_geography)`|
      |`ST_GEOGFROMGEOJSON`|`stgeogfromgeojson`|`ST_GEOGFROMGEOJSON(geojson_string)`|
      |`ST_GEOGFROMTEXT`|`stgeogfromtext`|`ST_GEOGFROMTEXT(wkt_string)`|
      |`ST_ASGEOJSON`|`stasgeojson`|`ST_ASGEOJSON(geography_expression)`|
      |`ST_ASTEXT`|`stastext`|`ST_ASTEXT(geography_expression)`|
      |`ST_BOUNDARY`|`stboundary`|`ST_BOUNDARY(geography_expression)`|
      |`ST_CENTROID`|`stcentroid`|`ST_CENTROID(geography_expression)`|
      |`ST_CLOSESTPOINT`|`stclosestpoint`|`ST_CLOSESTPOINT(geography_1, geography_2[, spheroid=FALSE])`|
      |`ST_DIFFERENCE`|`stdifference`|`ST_DIFFERENCE(geography_1, geography_2)`|
      |`ST_INTERSECTION`|`stintersection`|`ST_INTERSECTION(geography_1, geography_2)`|
      |`ST_SNAPTOGRID`|`stsnaptogrid`|`ST_SNAPTOGRID(geography_expression, grid_size)`|
      |`ST_UNION`|`stunion`|`ST_UNION({geography_1, geography_2 | array_of_geography})`|
      |`ST_CONTAINS`|`stcontains`|`ST_CONTAINS(geography_1, geography_2)`|
      |`ST_COVEREDBY`|`stcoveredby`|`ST_COVEREDBY(geography_1, geography_2)`|
      |`ST_COVERS`|`stcovers`|`ST_COVERS(geography_1, geography_2)`|
      |`ST_DISJOINT`|`stdisjoint`|`ST_DISJOINT(geography_1, geography_2)`|
      |`ST_DWITHIN`|`stdwithin`|`ST_DWITHIN(geography_1, geography_2, distance[, spheroid=FALSE])`|
      |`ST_EQUALS`|`stequals`|`ST_EQUALS(geography_1, geography_2)`|
      |`ST_INTERSECTS`|`stintersects`|`ST_INTERSECTS(geography_1, geography_2)`|
      |`ST_INTERSECTSBOX`|`stintersectsbox`|`ST_INTERSECTSBOX(geography, lng1, lat1, lng2, lat2)`|
      |`ST_TOUCHES`|`sttouches`|`ST_TOUCHES(geography_1, geography_2)`|
      |`ST_WITHIN`|`stwithin`|`ST_WITHIN(geography_1, geography_2)`|
      |`ST_ISEMPTY`|`stisempty`|`ST_ISEMPTY(geography_expression)`|
      |`ST_ISCOLLECTION`|`stiscollection`|`ST_ISCOLLECTION(geography_expression)`|
      |`ST_DIMENSION`|`stdimension`|`ST_DIMENSION(geography_expression)`|
      |`ST_NUMPOINTS`|`stnumpoints`|`ST_NUMPOINTS(geography_expression)`|
      |`ST_AREA`|`starea`|`ST_AREA(geography_expression[, spheroid=FALSE])`|
      |`ST_DISTANCE`|`stdistance`|`ST_DISTANCE(geography_1, geography_2[, spheroid=FALSE])`|
      |`ST_LENGTH`|`stlength`|`ST_LENGTH(geography_expression[, spheroid=FALSE])`|
      |`ST_MAXDISTANCE`|`stmaxdistance`|`ST_MAXDISTANCE(geography_1, geography_2[, spheroid=FALSE])`|
      |`ST_PERIMETER`|`stperimeter`|`ST_PERIMETER(geography_expression[, spheroid=FALSE])`|
      |`ST_UNION_AGG`|`stunionagg`|`ST_UNION_AGG(geography)`|

## [0.2.7] - 2018-09-02
1. Added supports 'BigQuery ML' Functions
    - Supported syntax highlighting
    - Added snippets of `ML.TRAINING_INFO` function
        - Prefix  
          `mltraininginfo`
        - Body
          ```sql
          ML.TRAINING_INFO(MODEL `project.dataset.model`)
          ```
        - Document  
          https://cloud.google.com/bigquery/docs/reference/standard-sql/bigqueryml-syntax-train
    - Added snippets of `ML.FEATURE_INFO` function
        - Prefix  
          `mlfeatureinfo`
        - Body
          ```sql
          ML.FEATURE_INFO(MODEL `project.dataset.model`)
          ```
        - Document  
          https://cloud.google.com/bigquery/docs/reference/standard-sql/bigqueryml-syntax-feature
    - Added snippets of `ML.WEIGHTS` function
        - Prefix  
          `mlweights`
        - Body
          ```sql
          ML.WEIGHTS(MODEL `project.dataset.model`)
          ```
        - Document  
          https://cloud.google.com/bigquery/docs/reference/standard-sql/bigqueryml-syntax-weights

## [0.2.6] - 2018-09-01
1. Added supports 'BOOL' data type
    - Supported syntax highlighting
    - Document  
      https://cloud.google.com/bigquery/docs/reference/standard-sql/data-types#boolean-type
2. Added supports 'BigQuery ML'
    - Supported syntax highlighting
    - Added snippets of `CREATE MODEL` statement
        - Prefix  
          `create model`
        - Body
          ```sql
          CREATE MODEL | CREATE MODEL IF NOT EXISTS | CREATE OR REPLACE MODEL `project.dataset.model`
          [OPTIONS(model_option_list)]
          [AS query_statement]
          ```
    - Added snippets of `ML.EVALUATE` function
        - Prefix  
          `mlevaluate`
        - Body
          ```sql
          ML.EVALUATE(MODEL `project.dataset.model`,
            {TABLE table_name | (query_statement)},
            [STRUCT( AS threshold)])
          ```
    - Added snippets of `ML.ROC_CURVE` function
        - Prefix  
          `mlroccurve`
        - Body
          ```sql
          ML.ROC_CURVE(MODEL `project.dataset.model`,
            {TABLE table_name | (query_statement)},
            [GENERATE_ARRAY(thresholds)])
          ```
    - Document  
      https://cloud.google.com/bigquery/docs/bigqueryml

## [0.2.5] - 2018-08-15
1. Added supports UDF(User-Defined Functions)
    - Supported 'JavaScript UDF' highlighting
    - Added snippets of UDF
        - JavaScript UDF
            - Prefix  
              `create function javascript`
            - Body
              ```sql
              CREATE TEMPORARY FUNCTION functionName(param_name param_type[, ...])
              RETURNS data_type
              LANGUAGE js AS """
                return "expression";
              """;
              ```
        - SQL UDF
            - Prefix  
              `create function sql`
            - Body
              ```sql
              CREATE TEMPORARY FUNCTION functionName(param_name param_type[, ...])
              [RETURNS data_type]
              AS (
                sql_expression
              );
              ```
    - Document  
      https://cloud.google.com/bigquery/docs/reference/standard-sql/user-defined-functions

## [0.2.4] - 2018-08-06
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

## [0.2.3] - 2018-06-03
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

## [0.2.2] - 2018-05-02
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
        - Body  
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
        - Body
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
        - Body
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

## [0.2.1] - 2018-02-26
- Add snippets.
  - `split` -> `SPLIT(value[, delimiter])`
  - `year` -> `EXTRACT(YEAR FROM date_expression)`
  - `month` -> `EXTRACT(MONTH FROM date_expression)`
  - `day` -> `EXTRACT(DAY FROM date_expression)`

## [0.2.0] - 2018-02-05
- Create snippets.
- Minor fixes.

## [0.1.5] - 2018-02-03
- Support partition decorator.
- Fix regexps content attribute.

## [0.1.4] - 2018-01-31
- Support for delete statement of tablename highlight.
  - Add `DELETE FROM <tablename>` highlight regrexp.

## [0.1.3] - 2018-01-29
- Fix table name regexp.

## [0.1.2] - 2018-01-29
- Fix GCP Project ID regexp.

## [0.1.1] - 2018-01-29
- Initial released.


[1.3.0]: https://github.com/shinichi-takii/atom-language-sql-bigquery/compare/v1.2.0...v1.3.0
[1.2.0]: https://github.com/shinichi-takii/atom-language-sql-bigquery/compare/v1.1.0...v1.2.0
[1.1.0]: https://github.com/shinichi-takii/atom-language-sql-bigquery/compare/v1.0.0...v1.1.0
[1.0.0]: https://github.com/shinichi-takii/atom-language-sql-bigquery/compare/v0.2.8...v1.0.0
[0.2.8]: https://github.com/shinichi-takii/atom-language-sql-bigquery/compare/v0.2.7...v0.2.8
[0.2.7]: https://github.com/shinichi-takii/atom-language-sql-bigquery/compare/v0.2.6...v0.2.7
[0.2.6]: https://github.com/shinichi-takii/atom-language-sql-bigquery/compare/v0.2.5...v0.2.6
[0.2.5]: https://github.com/shinichi-takii/atom-language-sql-bigquery/compare/v0.2.4...v0.2.5
[0.2.4]: https://github.com/shinichi-takii/atom-language-sql-bigquery/compare/v0.2.3...v0.2.4
[0.2.3]: https://github.com/shinichi-takii/atom-language-sql-bigquery/compare/v0.2.2...v0.2.3
[0.2.2]: https://github.com/shinichi-takii/atom-language-sql-bigquery/compare/v0.2.1...v0.2.2
[0.2.1]: https://github.com/shinichi-takii/atom-language-sql-bigquery/compare/v0.2.0...v0.2.1
[0.2.0]: https://github.com/shinichi-takii/atom-language-sql-bigquery/compare/v0.1.5...v0.2.0
[0.1.5]: https://github.com/shinichi-takii/atom-language-sql-bigquery/compare/v0.1.4...v0.1.5
[0.1.4]: https://github.com/shinichi-takii/atom-language-sql-bigquery/compare/v0.1.3...v0.1.4
[0.1.3]: https://github.com/shinichi-takii/atom-language-sql-bigquery/compare/v0.1.2...v0.1.3
[0.1.2]: https://github.com/shinichi-takii/atom-language-sql-bigquery/compare/v0.1.1...v0.1.2
[0.1.1]: https://github.com/shinichi-takii/atom-language-sql-bigquery/releases/tag/v0.1.1
