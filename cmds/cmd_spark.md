<details><summary style="font-size:25px;color:Orange">Basics</summary>

```python
# Show a preview
df.show()

# Show preview of first / last n rows
df.head(5)
df.tail(5)

# Show preview as JSON (WARNING: in-memory)
df = df.limit(10) # optional
print(json.dumps([row.asDict(recursive=True) for row in df.collect()], indent=2))

# Limit actual DataFrame to n rows (non-deterministic)
df = df.limit(5)

# Get columns
df.columns

# Get columns + column types
df.dtypes

# Get schema
df.schema

# Get row count
df.count()

# Get column count
len(df.columns)

# Write output to disk
df.write.csv('/path/to/your/output/file')

# Get results (WARNING: in-memory) as list of PySpark Rows
df = df.collect()

# Get results (WARNING: in-memory) as list of Python dicts
dicts = [row.asDict(recursive=True) for row in df.collect()]

# Convert (WARNING: in-memory) to Pandas DataFrame
df = df.toPandas()
```

</details>

---

<details><summary style="font-size:25px;color:Orange">Transformations & Actions</summary>

#### Transformations

-   **Selecting Columns**

```python
df.select("column1", "column2")
```

-   **Filtering Rows**

```python
df.filter(df.column1 == "value")
```

-   **Grouping and Aggretting**

```python
df.groupBy("column1").agg({"column2": "sum"})
```

-   **Joining**

```python
joined_df = df1.join(df2, "common_column")
```

-   **Ordering**

```python
df.orderBy("column1")
```

-   **Windowing**

```python
from pyspark.sql.window import Window
from pyspark.sql.functions import row_number

window = Window.partitionBy("column1").orderBy("column2")
df.withColumn("row_number", row_number().over(window))
```

#### Actions

-   **Counting Rows**

    ```python
    df.count()
    ```

-   **Collecting Data**

    ```python
    df.collect()
    ```

-   **Writting Data**

    ```python
    # CSV
    df.write.csv("path/to/output.csv", header=True)

    # JSON
    df.write.json("path/to/output.json")

    # Parquet
    df.write.parquet("path/to/output.parquet")
    ```

-   **Showing Data**

    ```python
    df.show()
    ```

-   **Summarizing Data**

    ```python
    df.describe().show()
    ```

</details>

---

<details><summary style="font-size:25px;color:Orange">Joins</summary>

```python

# Inner Join
inner_join_df = employees.join(departments, employees.DEPARTMENT_ID == departments.DEPARTMENT_ID, "inner")
inner_join_df.show()

# Left Outer Join
left_join_df = employees.join(departments, employees.DEPARTMENT_ID == departments.DEPARTMENT_ID, "left")
left_join_df.show()

# Right Outer Join
right_join_df = employees.join(departments, employees.DEPARTMENT_ID == departments.DEPARTMENT_ID, "right")
right_join_df.show()

# Full Outer Join
full_join_df = employees.join(departments, employees.DEPARTMENT_ID == departments.DEPARTMENT_ID, "outer")
full_join_df.show()

# Left Semi Join
left_semi_join_df = employees.join(departments, employees.DEPARTMENT_ID == departments.DEPARTMENT_ID, "leftsemi")
left_semi_join_df.show()

# Left Anti Join
left_anti_join_df = employees.join(departments, employees.DEPARTMENT_ID == departments.DEPARTMENT_ID, "leftanti")
left_anti_join_df.show()

# Cross Join
cross_join_df = employees.crossJoin(departments)
cross_join_df.show()

# ---------------------------

# Left join in another dataset
df = df.join(person_lookup_table, 'person_id', 'left')

# Match on different columns in left & right datasets
df = df.join(other_table, df.id == other_table.person_id, 'left')

# Match on multiple columns
df = df.join(other_table, ['first_name', 'last_name'], 'left')
```

</details>

---

<details><summary style="font-size:25px;color:Orange">UDF</summary>

In Apache PySpark, you can define and register user-defined functions (UDFs) to perform custom operations on DataFrame columns. There are several ways to define and register UDFs in PySpark:

#### Using udf from `pyspark.sql.functions`

-   **Example 1**: Simple Scalar UDF

    ```python
    from pyspark.sql import SparkSession
    from pyspark.sql.functions import udf
    from pyspark.sql.types import StringType

    # Initialize Spark Session
    spark = SparkSession.builder \
        .appName("UDF Example") \
        .getOrCreate()

    # Sample data
    data = [(1, "Alice"), (2, "Bob")]
    df = spark.createDataFrame(data, ["id", "name"])

    # Define a Python function
    def upper_case(name):
        return name.upper()

    # Register the UDF
    upper_case_udf = udf(upper_case, StringType())

    # Use the UDF
    df.withColumn("name_upper", upper_case_udf(df["name"])).show()

    # Stop Spark Session
    spark.stop()
    ```

-   **Example 2**: UDF with Type Hints

    ```python
    from pyspark.sql.types import IntegerType

    # Define a Python function with type hints
    def add_one(x: int) -> int:
        return x + 1

    # Register the UDF
    add_one_udf = udf(add_one, IntegerType())

    # Use the UDF
    df.withColumn("id_plus_one", add_one_udf(df["id"])).show()
    ```

#### Using `pandas_udf` for Vectorized UDFs

Vectorized UDFs are faster than standard UDFs because they utilize Apache Arrow to batch process data.

```python
from pyspark.sql.functions import pandas_udf
from pyspark.sql.types import StringType
import pandas as pd

# Define a vectorized UDF
@pandas_udf(StringType())
def upper_case_vec(names: pd.Series) -> pd.Series:
    return names.str.upper()

# Use the vectorized UDF
df.withColumn("name_upper", upper_case_vec(df["name"])).show()
```

#### Register and Use UDF in SQL

You can register UDFs as SQL functions and use them in SQL queries.

```python
# Register the UDF
spark.udf.register("upper_case_sql", upper_case, StringType())

# Create a temporary view
df.createOrReplaceTempView("people")

# Use the UDF in a SQL query
spark.sql("SELECT id, name, upper_case_sql(name) as name_upper FROM people").show()
```

#### Using `pandas_udf` for Grouped Map Operations

Grouped map operations allow you to apply a UDF to each group of data, which is useful for complex transformations.

```python
from pyspark.sql.functions import pandas_udf, PandasUDFType
from pyspark.sql.types import StructType, StructField, IntegerType, StringType

# Sample data with a group column
data = [(1, "Alice", "A"), (2, "Bob", "B"), (3, "Charlie", "A"), (4, "David", "B")]
df = spark.createDataFrame(data, ["id", "name", "group"])

# Define a grouped map UDF
@pandas_udf(
    StructType([
        StructField("id", IntegerType()),
        StructField("name", StringType()),
        StructField("group", StringType()),
        StructField("name_upper", StringType())
    ]),
    PandasUDFType.GROUPED_MAP
)
def upper_case_grouped(df: pd.DataFrame) -> pd.DataFrame:
    df["name_upper"] = df["name"].str.upper()
    return df

# Use the grouped map UDF
df.groupby("group").apply(upper_case_grouped).show()
```

#### Notes

-   **Standard UDFs (udf)**: Suitable for scalar operations and simple transformations. Defined using pyspark.sql.functions.udf.
-   **Vectorized UDFs (pandas_udf)**: Utilize Apache Arrow for performance optimization, suitable for batch operations. Defined using pyspark.sql.functions.pandas_udf.
-   **SQL UDFs**: Register UDFs as SQL functions using spark.udf.register and use them in SQL queries.
-   **Grouped Map UDFs (pandas_udf with PandasUDFType.GROUPED_MAP)**: Apply UDFs to each group of data, useful for complex group-based transformations.

</details>

---

<details><summary style="font-size:25px;color:Orange">Handling Missing Values</summary>

#### Filtering

```python
# Filter on equals condition
df = df.filter(df.is_adult == 'Y')

# Filter on >, <, >=, <= condition
df = df.filter(df.age > 25)

# Multiple conditions require parentheses around each condition
df = df.filter((df.age > 25) & (df.is_adult == 'Y'))

# Compare against a list of allowed values
df = df.filter(col('first_name').isin([3, 4, 7]))

# Sort results
df = df.orderBy(df.age.asc()))
df = df.orderBy(df.age.desc()))
```

#### Column Operations

```python
# Add a new static column
df = df.withColumn('status', F.lit('PASS'))

# Construct a new dynamic column
df = df.withColumn('full_name', F.when(
    (df.fname.isNotNull() & df.lname.isNotNull()), F.concat(df.fname, df.lname)
).otherwise(F.lit('N/A'))

# Pick which columns to keep, optionally rename some
df = df.select(
    'name',
    'age',
    F.col('dob').alias('date_of_birth'),
)

# Remove columns
df = df.drop('mod_dt', 'mod_username')

# Rename a column
df = df.withColumnRenamed('dob', 'date_of_birth')

# Keep all the columns which also occur in another dataset
df = df.select(*(F.col(c) for c in df2.columns))

# Batch Rename/Clean Columns
for col in df.columns:
    df = df.withColumnRenamed(col, col.lower().replace(' ', '_').replace('-', '_'))
```

#### Casting & Coalescing Null Values & Duplicates

```python
# Cast a column to a different type
df = df.withColumn('price', df.price.cast(T.DoubleType()))

# Replace all nulls with a specific value
df = df.fillna({
    'first_name': 'Tom',
    'age': 0,
})

# Take the first value that is not null
df = df.withColumn('last_name', F.coalesce(df.last_name, df.surname, F.lit('N/A')))

# Drop duplicate rows in a dataset (distinct)
df = df.dropDuplicates() # or
df = df.distinct()

# Drop duplicate rows, but consider only specific columns
df = df.dropDuplicates(['name', 'height'])

# Replace empty strings with null (leave out subset keyword arg to replace in all columns)
df = df.replace({"": None}, subset=["name"])

# Convert Python/PySpark/NumPy NaN operator to null
df = df.replace(float("nan"), None)
```

##### Example

```python
# Initialize SparkSession
spark = SparkSession.builder.appName("HandleMissingData").getOrCreate()

# Sample data with missing values
data = [
    (1, "John", None),
    (2, None, 5000),
    (3, "Sara", 4500),
    (None, "David", None),
    (5, "Mike", 5500)
]

# Define schema
schema = ["id", "name", "salary"]

# Create DataFrame
df = spark.createDataFrame(data, schema)

# Show the DataFrame
df.show()

# Drop rows with any null values
df_dropped_any = df.na.drop()
df_dropped_any.show()

# Drop rows with all null values
df_dropped_all = df.na.drop(how='all')
df_dropped_all.show()

# Drop rows with null values in specific columns
df_dropped_subset = df.na.drop(subset=['name', 'salary'])
df_dropped_subset.show()

# Fill all null values with a specified value
df_filled_all = df.na.fill("Unknown")
df_filled_all.show()

# Fill null values in specific columns
df_filled_subset = df.na.fill({"name": "Unknown", "salary": 0})
df_filled_subset.show()

# Replace specific values
# df_replaced = df.na.replace({None: "Unknown"})
# df_replaced.show()

# Using SQL to handle missing data
df.createOrReplaceTempView("people")
filled_df_sql = spark.sql("""
SELECT id,
       COALESCE(name, 'Unknown') as name,
       COALESCE(salary, 0) as salary
FROM people
""")
filled_df_sql.show()

# Stop the SparkSession
spark.stop()
```

</details>

---

<details><summary style="font-size:25px;color:Orange">Useful Builtin Functions</summary>

## String Operations

#### String Filters

```python
# Contains - col.contains(string)
df = df.filter(df.name.contains('o'))

# Starts With - col.startswith(string)
df = df.filter(df.name.startswith('Al'))

# Ends With - col.endswith(string)
df = df.filter(df.name.endswith('ice'))

# Is Null - col.isNull()
df = df.filter(df.is_adult.isNull())

# Is Not Null - col.isNotNull()
df = df.filter(df.first_name.isNotNull())

# Like - col.like(string_with_sql_wildcards)
df = df.filter(df.name.like('Al%'))

# Regex Like - col.rlike(regex)
df = df.filter(df.name.rlike('[A-Z]*ice$'))

# Is In List - col.isin(*cols)
df = df.filter(df.name.isin('Bob', 'Mike'))
```

#### String Functions

```python
# Substring - col.substr(startPos, length)
df = df.withColumn('short_id', df.id.substr(0, 10))

# Trim - F.trim(col)
df = df.withColumn('name', F.trim(df.name))

# Left Pad - F.lpad(col, len, pad)
# Right Pad - F.rpad(col, len, pad)
df = df.withColumn('id', F.lpad('id', 4, '0'))

# Left Trim - F.ltrim(col)
# Right Trim - F.rtrim(col)
df = df.withColumn('id', F.ltrim('id'))

# Concatenate - F.concat(*cols)
df = df.withColumn('full_name', F.concat('fname', F.lit(' '), 'lname'))

# Concatenate with Separator/Delimiter - F.concat_ws(delimiter, *cols)
df = df.withColumn('full_name', F.concat_ws('-', 'fname', 'lname'))

# Regex Replace - F.regexp_replace(str, pattern, replacement)[source]
df = df.withColumn('id', F.regexp_replace(id, '0F1(.*)', '1F1-$1'))

# Regex Extract - F.regexp_extract(str, pattern, idx)
df = df.withColumn('id', F.regexp_extract(id, '[0-9]*', 0))
```

#### Number Operations

```python
# Round - F.round(col, scale=0)
df = df.withColumn('price', F.round('price', 0))

# Floor - F.floor(col)
df = df.withColumn('price', F.floor('price'))

# Ceiling - F.ceil(col)
df = df.withColumn('price', F.ceil('price'))

# Absolute Value - F.abs(col)
df = df.withColumn('price', F.abs('price'))

# X raised to power Y – F.pow(x, y)
df = df.withColumn('exponential_growth', F.pow('x', 'y'))

# Select smallest value out of multiple columns – F.least(*cols)
df = df.withColumn('least', F.least('subtotal', 'total'))

# Select largest value out of multiple columns – F.greatest(*cols)
df = df.withColumn('greatest', F.greatest('subtotal', 'total'))
```

#### Date & Timestamp Operations

```python
# Add a column with the current date
df = df.withColumn('current_date', F.current_date())

# Convert a string of known format to a date (excludes time information)
df = df.withColumn('date_of_birth', F.to_date('date_of_birth', 'yyyy-MM-dd'))

# Convert a string of known format to a timestamp (includes time information)
df = df.withColumn('time_of_birth', F.to_timestamp('time_of_birth', 'yyyy-MM-dd HH:mm:ss'))

# Get year from date:       F.year(col)
# Get month from date:      F.month(col)
# Get day from date:        F.dayofmonth(col)
# Get hour from date:       F.hour(col)
# Get minute from date:     F.minute(col)
# Get second from date:     F.second(col)
df = df.filter(F.year('date_of_birth') == F.lit('2017'))

# Add & subtract days
df = df.withColumn('three_days_after', F.date_add('date_of_birth', 3))
df = df.withColumn('three_days_before', F.date_sub('date_of_birth', 3))

# Add & Subtract months
df = df.withColumn('next_month', F.add_month('date_of_birth', 1))

# Get number of days between two dates
df = df.withColumn('days_between', F.datediff('start', 'end'))

# Get number of months between two dates
df = df.withColumn('months_between', F.months_between('start', 'end'))

# Keep only rows where date_of_birth is between 2017-05-10 and 2018-07-21
df = df.filter(
    (F.col('date_of_birth') >= F.lit('2017-05-10')) &
    (F.col('date_of_birth') <= F.lit('2018-07-21'))
)
```

#### Array Operations

```python
# Column Array - F.array(*cols)
df = df.withColumn('full_name', F.array('fname', 'lname'))

# Empty Array - F.array(*cols)
df = df.withColumn('empty_array_column', F.array([]))

# Get element at index – col.getItem(n)
df = df.withColumn('first_element', F.col("my_array").getItem(0))

# Array Size/Length – F.size(col)
df = df.withColumn('array_length', F.size('my_array'))

# Flatten Array – F.flatten(col)
df = df.withColumn('flattened', F.flatten('my_array'))

# Unique/Distinct Elements – F.array_distinct(col)
df = df.withColumn('unique_elements', F.array_distinct('my_array'))

# Map over & transform array elements – F.transform(col, func: col -> col)
df = df.withColumn('elem_ids', F.transform(F.col('my_array'), lambda x: x.getField('id')))

# Return a row per array element – F.explode(col)
df = df.select(F.explode('my_array'))
```

#### Struct Operations

```python
# Make a new Struct column (similar to Python's `dict()`) – F.struct(*cols)
df = df.withColumn('my_struct', F.struct(F.col('col_a'), F.col('col_b')))

# Get item from struct by key – col.getField(str)
df = df.withColumn('col_a', F.col('my_struct').getField('col_a'))
```

</details>

---

<details><summary style="font-size:25px;color:Orange">MISC</summary>

#### Aggregation Operations

```python
# Row Count:                F.count()
# Sum of Rows in Group:     F.sum(*cols)
# Mean of Rows in Group:    F.mean(*cols)
# Max of Rows in Group:     F.max(*cols)
# Min of Rows in Group:     F.min(*cols)
# First Row in Group:       F.alias(*cols)
df = df.groupBy('gender').agg(F.max('age').alias('max_age_by_gender'))

# Collect a Set of all Rows in Group:       F.collect_set(col)
# Collect a List of all Rows in Group:      F.collect_list(col)
df = df.groupBy('age').agg(F.collect_set('name').alias('person_names'))

# Just take the lastest row for each combination (Window Functions)
from pyspark.sql import Window as W

window = W.partitionBy("first_name", "last_name").orderBy(F.desc("date"))
df = df.withColumn("row_number", F.row_number().over(window))
df = df.filter(F.col("row_number") == 1)
df = df.drop("row_number")
```

#### Repartitioning

```python
# Repartition – df.repartition(num_output_partitions)
df = df.repartition(1)
```

#### Useful Functions / Transformations

```python
def flatten(df: DataFrame, delimiter="_") -> DataFrame:
    '''
    Flatten nested struct columns in `df` by one level separated by `delimiter`, i.e.:

    df = [ {'a': {'b': 1, 'c': 2} } ]
    df = flatten(df, '_')
    -> [ {'a_b': 1, 'a_c': 2} ]
    '''
    flat_cols = [name for name, type in df.dtypes if not type.startswith("struct")]
    nested_cols = [name for name, type in df.dtypes if type.startswith("struct")]

    flat_df = df.select(
        flat_cols
        + [F.col(nc + "." + c).alias(nc + delimiter + c) for nc in nested_cols for c in df.select(nc + ".*").columns]
    )
    return flat_df


def lookup_and_replace(df1, df2, df1_key, df2_key, df2_value):
    '''
    Replace every value in `df1`'s `df1_key` column with the corresponding value
    `df2_value` from `df2` where `df1_key` matches `df2_key`

    df = lookup_and_replace(people, pay_codes, id, pay_code_id, pay_code_desc)
    '''
    return (
        df1
        .join(df2[[df2_key, df2_value]], df1[df1_key] == df2[df2_key], 'left')
        .withColumn(df1_key, F.coalesce(F.col(df2_value), F.col(df1_key)))
        .drop(df2_key)
        .drop(df2_value)
    )

```

</details>
