-   [AWS Glue PySpark extensions](https://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-python-extensions.html)

<details open><summary style="font-size:25px;color:Orange">I/O in awsglue</summary>

```python
from awsglue.context import GlueContext
from awsglue.transforms import ApplyMapping
from awsglue.dynamicframe import DynamicFrame
from pyspark.context import SparkContext
import sys

# Initialize Spark and Glue contexts
sc = SparkContext.getOrCreate()
glueContext = GlueContext(sc)
```

#### READ

1. **`create_dynamic_frame.from_catalog()`**: Load a table from the Glue Data Catalog.

    ```python
    # Read data from Glue Data Catalog
    dynamic_frame_catalog = glueContext.create_dynamic_frame.from_catalog(
        database="my_database",
        table_name="my_table"
    )
    dynamic_frame_catalog.show()
    ```

2. **`create_dynamic_frame.from_options()`**: Load data from other sources, such as S3, JDBC, or other databases.

    ```python
    # Read JSON data from S3
    dynamic_frame_s3 = glueContext.create_dynamic_frame.from_options(
        connection_type="s3",
        connection_options={"paths": ["s3://my-bucket/my-folder/"]},
        format="json"
    )
    dynamic_frame_s3.show()
    ```

3. **`create_dynamic_frame.from_options()`**: To read data from a JDBC source (like PostgreSQL, MySQL, etc.) into a DynamicFrame, use the `create_dynamic_frame.from_options` method.

    ```python
    # Set up JDBC connection options
    jdbc_options = {
        "url": "jdbc:mysql://hostname:port/database",  # JDBC URL for the database
        "user": "username",  # Database username
        "password": "password",  # Database password
        "dbtable": "table_name",  # Table to read from
        "driver": "com.mysql.cj.jdbc.Driver"  # JDBC driver class name
    }

    # Read data from JDBC into a DynamicFrame
    dynamic_frame = glueContext.create_dynamic_frame.from_options(
        connection_type="jdbc",
        connection_options=jdbc_options
    )

    ```

4. **`create_dynamic_frame.from_rdd()`**: Create a `DynamicFrame` from an RDD.

    ```python
    # Create an RDD from a list
    rdd = sc.parallelize([
        {"name": "Alice", "age": 30},
        {"name": "Bob", "age": 45}
    ])

    # Convert RDD to DynamicFrame
    dynamic_frame_rdd = glueContext.create_dynamic_frame.from_rdd(rdd, "rdd_dynamic_frame")
    dynamic_frame_rdd.show()
    ```

5. **`create_dynamic_frame.from_dataframe()`**: Convert a Spark DataFrame to a `DynamicFrame`.

    ```python
    from pyspark.sql import SparkSession
    from pyspark.sql import Row

    # Create a Spark DataFrame
    spark = SparkSession.builder.getOrCreate()
    df = spark.createDataFrame([Row(name="Charlie", age=50), Row(name="Diana", age=40)])

    # Convert Spark DataFrame to Glue DynamicFrame
    dynamic_frame_df = glueContext.create_dynamic_frame.from_dataframe(df, glueContext, "dynamic_frame_df")
    dynamic_frame_df.show()
    ```

#### WRITE

1. **`write_dynamic_frame.from_options()`**: Write a `DynamicFrame` to a destination, such as S3.

    ```python
    # Write DynamicFrame to S3 as JSON
    glueContext.write_dynamic_frame.from_options(
        frame=dynamic_frame_s3,
        connection_type="s3",
        connection_options={"path": "s3://my-output-bucket/output-folder/"},
        format="json"
    )
    ```

    ```python
    # Write DynamicFrame to JDBC
    glueContext.write_dynamic_frame.from_options(
        frame=dynamic_frame,
        connection_type="jdbc",
        connection_options=jdbc_options_write
    )
    ```

2. **`write_dynamic_frame.from_catalog()`**: Write a `DynamicFrame` to a Glue Data Catalog table.

    ```python
    # Write DynamicFrame to Glue Data Catalog
    glueContext.write_dynamic_frame.from_catalog(
        frame=dynamic_frame_catalog,
        database="my_output_database",
        table_name="my_output_table"
    )
    ```

3. **`write_from_options()`**: Writes and returns a DynamicFrame or DynamicFrameCollection that is created with the specified connection and format information.

    ```python

    ```

4. **`write_data_frame_from_catalog()`**: Writes and returns a DataFrame using information from a Data Catalog database and table. This method supports writing to data lake formats (Hudi, Iceberg, and Delta Lake)

    ```python

    ```

5. **`get_sink()`**: Define a sink (target) for a data output, particularly useful when output specifications require more configuration.

    ```python
    # Configure S3 as the output sink
    sink = glueContext.getSink(
        connection_type="s3",
        path="s3://my-output-bucket/output-folder/",
        format="parquet"
    )

    # Write data to the sink
    sink.writeFrame(dynamic_frame_catalog)
    ```

</details>

---

<details open><summary style="font-size:25px;color:Orange">Job API in awsglue</summary>

The `awsglue.job.Job` class in Python is part of the AWS Glue library and is typically used to handle and control ETL jobs within an AWS Glue environment. It provides a way to initiate, manage, and monitor AWS Glue jobs, which are commonly used for transforming and moving data across different data stores on AWS.

1. **Job Management**: `awsglue.job.Job` allows for starting and stopping Glue jobs, and monitoring their states (e.g., RUNNING, SUCCEEDED, FAILED).
2. **Parameter Handling**: Glue jobs often require specific parameters to run, and `awsglue.job.Job` makes it easy to fetch these parameters for ETL tasks.
3. **Integration with AWS Glue ETL Scripts**: The class is designed to integrate well with the Glue job execution framework, making it a convenient option for organizing ETL logic directly in Glue.
4. **Example**:

    ```python
    # Import necessary AWS Glue libraries and Spark
    from awsglue.context import GlueContext
    from awsglue.job import Job
    from awsglue.utils import getResolvedOptions
    from awsglue.dynamicframe import DynamicFrame
    from pyspark.sql import SparkSession
    import sys

    # Initialize a Spark session and Glue context
    spark = SparkSession.builder.appName("Glue_ETL_Job").getOrCreate()
    glueContext = GlueContext(spark.sparkContext)

    # Define the expected parameters
    args = getResolvedOptions(sys.argv, ['JOB_NAME', 'SOURCE_BUCKET', 'DESTINATION_BUCKET', 'PARTITION_DATE'])

    # Initialize the Glue job
    job = Job(glueContext)
    job.init(args['JOB_NAME'], args)

    # Extract parameters
    source_bucket = args['SOURCE_BUCKET']         # e.g., 's3://my-source-bucket/data/'
    destination_bucket = args['DESTINATION_BUCKET'] # e.g., 's3://my-destination-bucket/processed/'
    partition_date = args['PARTITION_DATE']       # e.g., '2024-11-01'

    # Step 1: Extract - Load data as DynamicFrame from the source S3 bucket
    source_path = f"{source_bucket}{partition_date}/"
    data_dynamic_frame = glueContext.create_dynamic_frame.from_options(
        connection_type="s3",
        connection_options={"paths": [source_path]},
        format="json"
    )

    # Print schema for debugging purposes
    print("Source Data Schema:")
    data_dynamic_frame.printSchema()

    # Step 2: Transform - Apply transformations on the DynamicFrame
    # Selecting specific fields and filtering records
    transformed_dynamic_frame = data_dynamic_frame.select_fields(["id", "name", "date", "status"]) \
        .filter(lambda row: row["status"] == "active")

    # Step 3: Load - Write the transformed data to the destination bucket in Parquet format
    destination_path = f"{destination_bucket}{partition_date}/"
    glueContext.write_dynamic_frame.from_options(
        frame=transformed_dynamic_frame,
        connection_type="s3",
        connection_options={"path": destination_path},
        format="parquet",
        format_options={"compression": "snappy"}
    )

    # Commit the Glue job to signal completion
    job.commit()

    print(f"ETL Job completed. Transformed data is saved to {destination_path}")

    ```

In the AWS Glue script above, initializing and committing the `Job` object is essential for defining and properly executing an AWS Glue job. Here’s why each part—initializing and committing—is important:

1. **Initializing the `Job` Object**

    ```python
    job = Job(glueContext)
    ```

    - The `Job` object represents the entire Glue job in the context of AWS Glue's infrastructure. Initializing this object with `glueContext` registers it within the AWS Glue service and makes Glue aware that this script is intended to be run as a managed job.
    - This initialization step is required if you want the job to be trackable in the AWS Glue console and to take advantage of features such as tracking job metadata, monitoring job runs, and retrying jobs upon failure.

2. **Committing the `Job` Object**

    ```python
    job.commit()
    ```

    - Calling `job.commit()` marks the completion of the Glue job, finalizing the job's execution.
    - `job.commit()` also performs any last-minute checkpointing necessary for job tracking and logging in AWS Glue. Without it, the job run might be considered incomplete, and AWS Glue won’t finalize the execution, which can impact job state reporting and prevent subsequent Glue workflows from proceeding.
    - In some cases, `job.commit()` also commits the transaction if Glue is working with data sources that support transactional semantics, ensuring all operations performed during the job are consistent.
    - The `job.commit()` call is critical for accurate status reporting and clean resource management within AWS Glue.

3. **Impact of Omitting `job.commit()`**: If `job.commit()` is omitted, AWS Glue does not recognize the job as fully complete, and this has several possible consequences:

    - The job might appear to be stuck in a "running" state in the Glue console, as Glue does not receive the final notification of completion.
    - AWS Glue workflows that depend on this job may not proceed, as the job status is not marked as “Completed.”
    - Any resources provisioned for this job might not be released properly, which could lead to cost inefficiencies.

4. **Notes**:

    - When you create an AWS Glue job in the console or via the CLI, you specify the `JOB_NAME` and any other parameters you need, which are passed to `getResolvedOptions`. These parameters allow the Glue job to access different configurations and data sources dynamically.
    - Suppose you need to read data from an S3 bucket, apply a transformation, and save the output to another bucket. You can set up this ETL workflow in Glue with the `awsglue.job.Job` class to manage the job flow, retry on failures, and monitor the job’s execution.

5. **Start the Job using AWS SDK**:

    ```python
    import boto3

    # Initialize the Glue client
    glue_client = boto3.client('glue')

    # Define the job name and parameters
    job_name = "my_etl_job"
    job_parameters = {
        "--JOB_NAME": job_name,
        "--SOURCE_BUCKET": "s3://my-source-bucket/data/",
        "--DESTINATION_BUCKET": "s3://my-destination-bucket/processed/",
        "--PARTITION_DATE": "2024-11-01"
    }

    # Start the Glue job with parameters
    response = glue_client.start_job_run(
        JobName=job_name,
        Arguments=job_parameters
    )

    # Get the Job Run ID to track the job status
    job_run_id = response['JobRunId']
    print(f"Started Glue job '{job_name}' with JobRunId: {job_run_id}")
    ```

</details>

---

<details open><summary style="font-size:25px;color:Orange">GlueContext API in awsglue</summary>

The `GlueContext` is the entry point for AWS Glue functionalities. It wraps around the SparkContext and provides access to AWS Glue's features.

-   `create_dynamic_frame.from_catalog()`: Reads data from the AWS Glue Data Catalog.
-   `create_dynamic_frame.from_options()`: Reads data from various data sources like S3, JDBC, and DynamoDB.
-   `create_dynamic_frame.from_rdd()`: Creates a `DynamicFrame` from an RDD.
-   `create_dynamic_frame.from_dataframe()`: Converts a Spark DataFrame to a Glue `DynamicFrame`.
-   `create_data_frame.from_catalog()`: Creates a Spark DataFrame from the Glue Data Catalog.
-   `create_data_frame.from_options()`: Creates a Spark DataFrame from a specified data source.
-   `write_dynamic_frame.from_options()`: Writes a `DynamicFrame` to a specific output.
-   `write_dynamic_frame.from_catalog()`: Writes a `DynamicFrame` to the Glue Data Catalog.
-   `get_sink()`: Gets a sink (destination) for a given `DynamicFrame`.

---

1.  **Job Bookmarks**: Track job bookmarks, which record the last processed state of data. Useful for incremental loads.

    -   **Get Bookmark**: `get_bookmark()` retrieves the bookmark for a specific data source.

    ```python
    bookmark = glueContext.get_bookmark("my_job_name")
    print(bookmark)
    ```

    -   **Set Bookmark**: `set_bookmark()` sets a bookmark for tracking processed data.

    ```python
    glueContext.set_bookmark("my_job_name", bookmark_state={"last_processed_id": 1234})
    ```

    -   **Remove Bookmark**: `remove_bookmark()` clears the bookmark.

    ```python
    glueContext.remove_bookmark("my_job_name")
    ```

2.  **GlueContext Extensions: `create_catalog_table()` and `update_catalog_table()`** interact with the Glue Data Catalog to create or update table definitions.

    -   **Create a New Table in Glue Catalog**: `create_catalog_table()` creates a new table in the Glue Data Catalog.

    ```python
    glueContext.create_catalog_table(
        database="my_database",
        table_name="new_table",
        schema=dynamic_frame_catalog.schema()
    )
    ```

    -   **Update an Existing Table in Glue Catalog**: `update_catalog_table()` updates an existing table in the Glue Data Catalog.

    ```python
    glueContext.update_catalog_table(
        database="my_database",
        table_name="existing_table",
        schema=dynamic_frame_catalog.schema()
    )
    ```

</details>

---

<details open><summary style="font-size:25px;color:Orange">DynamicFrame API in awsglue</summary>

**DynamicFrame** is a distributed data structure in AWS Glue, which supports schema inference and transformations.

A `DynamicFrame` is a distributed data structure used in AWS Glue, similar to a Spark DataFrame but optimized for AWS Glue ETL transformations.

-   `toDF()`: Converts a `DynamicFrame` to a Spark DataFrame.
-   `fromDF()`: Converts a Spark DataFrame to a `DynamicFrame`.
-   `apply_mapping()`: Applies transformations to the columns in a `DynamicFrame`.
-   `select_fields()`: Selects specific fields from a `DynamicFrame`.
-   `drop_fields()`: Drops specific fields from a `DynamicFrame`.
-   `resolveChoice()`: Resolves ambiguous data types in a `DynamicFrame`.
-   `rename_field()`: Renames a specific field.
-   `filter()`: Filters rows based on a condition.
-   `map()`: Applies a function to each record.
-   `relationalize()`: Flattens nested structures in a `DynamicFrame`.

-   **`toDF()`** Converts a `DynamicFrame` to a Spark DataFrame.

    ```python
    df = dynamic_frame.toDF()
    ```

-   **`apply_mapping()`** Maps fields and performs type conversions.

    ```python
    mapped_dynamic_frame = dynamic_frame.apply_mapping(
        [("old_col1", "string", "new_col1", "int"),
         ("old_col2", "double", "new_col2", "double")]
    )
    ```

-   **`resolveChoice()`** Resolves data types ambiguities in a `DynamicFrame`.

    ```python
    resolved_dynamic_frame = dynamic_frame.resolveChoice(
        specs=[("column_name", "cast:int")]
    )
    ```

-   **`select_fields()`** Selects specific fields from a `DynamicFrame`.

    ```python
    selected_dynamic_frame = dynamic_frame.select_fields(["field1", "field2"])
    ```

-   **`filter()`** Filters data based on a condition.

    ```python
    filtered_dynamic_frame = dynamic_frame.filter(
        lambda row: row["column_name"] > 100
    )
    ```

-   **`rename_field()`** Renames a field in a `DynamicFrame`.

        ```python
        renamed_dynamic_frame = dynamic_frame.rename_field("old_name", "new_name")
        ```

</details>

---

<details open><summary style="font-size:25px;color:Orange">GlueTransform API in awsglue</summary>

**GlueTransform** GlueTransform is a base class for AWS Glue transformations.

-   `SelectFields`: Select specific fields from a `DynamicFrame`.
-   `DropFields`: Drop fields from a `DynamicFrame`.
-   `Join`: Join two `DynamicFrames`.
-   `Map`: Apply a custom mapping function to transform data.
-   `Filter`: Filter out records based on a specified condition.
-   `ApplyMapping`: Used for column renaming and type casting.

-   **`Join`** Joins two `DynamicFrames`.

    ```python
    joined_frame = DynamicFrame.fromDF(
        df1.join(df2, df1["key"] == df2["key"], "inner"), glueContext, "joined_frame"
    )
    ```

-   **`ApplyMapping`** Used for remapping fields and changing data types.

        ```python
        transformed_dynamic_frame = ApplyMapping.apply(
            frame=dynamic_frame,
            mappings=[("source_column", "string", "target_column", "int")]
        )
        ```

</details>

---

<details open><summary style="font-size:25px;color:Orange">Util API in awsglue</summary>

The `awsglue.utils` module provides helper functions for managing job parameters and bookmarks.

-   `getResolvedOptions(sys.argv, ['ARG_NAME'])`: Parses job arguments.
-   `convert_to_dict()`: Converts a `DynamicFrame` to a Python dictionary.
-   `get_job_bookmark_state()`: Gets the current state of a job bookmark.
-   `reset_job_bookmark()`: Resets the job bookmark.

-   **`getResolvedOptions()`** Parses job arguments for flexibility in configuring jobs.

    ```python
    from awsglue.utils import getResolvedOptions
    import sys

    args = getResolvedOptions(sys.argv, ['JOB_NAME', 'INPUT_PATH'])
    ```

-   **`convert_to_dict()`** Converts a `DynamicFrame` to a Python dictionary for easier manipulation.

    ```python
    dict_data = dynamic_frame.toDF().collect()
    ```

-   **`get_job_bookmark_state()`** Retrieves the state of a job bookmark, useful in incremental processing.

        ```python
        state = glueContext.get_job_bookmark_state("job_name")
        ```

</details>

---

<details open><summary style="font-size:25px;color:Orange">Glue Data API in awsglue</summary>

**Glue Data Types**: Glue provides several specialized data types to manage data schema in `DynamicFrames`.

-   **`ArrayType`** Represents array types in schema definition.

    ```python
    from awsglue import DynamicFrame
    from pyspark.sql.types import ArrayType, StringType

    schema = ArrayType(StringType())
    ```

-   **`StructType`** Used to define complex nested structures.

    ```python
    from pyspark.sql.types import StructType, StructField, StringType

    schema = StructType([StructField("field1", StringType(), True)])
    ```

</details>

---

1. **Commonly Used Classes for Data Source Options**

    - **JDBC**: Used to connect to relational databases.
    - **S3**: Connects to data stored in S3, often using Parquet, JSON, or CSV format.
    - **DynamoDB**: Reads and writes data to Amazon DynamoDB tables.

#### Imports

```python
from pyspark.context import SparkContext
from awsglue.context import GlueContext
from awsglue.transforms import Join
from awsglue.transforms import *
from awsglue.utils import getResolvedOptions
from awsglue.job import Job


sc = SparkContext.getOrCreate()
glueContext = GlueContext(sc)
```
