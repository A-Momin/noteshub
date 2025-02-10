-   <details><summary style="font-size:25px;color:Orange;text-align:left">Courses & Tutorials</summary>

    -   [AWS: TERRAFORM DOCUMENTATION](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
    -   [HCL Language Documentation](https://developer.hashicorp.com/terraform/language)
        -   [Expressions](https://developer.hashicorp.com/terraform/language/expressions)
    -   [TERRAFORM CLI](https://developer.hashicorp.com/terraform/cli)
    -   [Terraform Tips & Tricks: loops, if-statements, and more](https://www.youtube.com/watch?v=7S94oUTy2z4&list=PLiMWaCMwGJXmJdmfJjG3aK1IkU7oWvxIj&index=4)
    -   [50+ Terraform Molules](https://github.com/clouddrove?utf8=%E2%9C%93&q=terraform-&type=&language=)

    -   [Terraform Real World Use Case | Process SQS Messages With Lambda and Upload to S3 | 9886611117](https://www.youtube.com/watch?v=etru_8t7Dyk)
    -   [How do I deploy AWS Lambda using Terraform?](https://www.youtube.com/watch?v=JSR7U700h0U)
    -   [Master Terraform Interview Questions with this Easy Demo](https://www.youtube.com/watch?v=LPW3VriwLVs&list=PLH1ul2iNXl7v5qKBE62pp6GjmodSm5Wbb)
    -   [Terraform Interview ( Mock Interview )](https://www.youtube.com/watch?v=pCoCynze4Ag)

    #### Courses:

    -   [HashiCorp Terraform Associate Certification Course - Pass the Exam!](https://www.youtube.com/watch?v=V4waklkBC38)
    -   [HashiCorp Terraform Associate Certification Course (003) - Pass the Exam!](https://www.youtube.com/watch?v=SPcwo0Gq9T8&t=4685s)
    -   [Terraform by RahulWagh](https://www.youtube.com/playlist?list=PL7iMyoQPMtAOz187ezONf7pL8oGZRobYl)
        -   [CODE](https://github.com/in28minutes/devops-master-class/tree/master/terraform)
    -   [Complete Terraform Course - From BEGINNER to PRO! (Learn Infrastructure as Code)](https://www.youtube.com/watch?v=7xngnjfIlK4&t=178s)
    -   [Terraform Course - Automate your AWS cloud infrastructure](https://www.youtuzbe.com/watch?v=SLB_c_ayRMo&t=2725s)

    -   [How to Create AWS Lambda with Terraform? (API Gateway & GET/POST & IAM S3 Access & Dependencies)](https://antonputra.com/amazon/how-to-create-aws-lambda-with-terraform/)
    -   [AWS Lambda – Terraform Example with API Gateway](https://tekanaid.com/posts/aws-lambda-terraform-configuration-example-with-api-gateway#code)
    -   [Terraform to create AWS SNS | GitHub Actions](https://www.youtube.com/watch?v=e7P0TGwp1VA&t=679s)
    -   [Terraform to create AWS SNS and AWS SQS service which invokes AWS lambda function | GitHub Actions](https://www.youtube.com/watch?v=tTD5D9ZHYUc)

    </details>

---

-   <details><summary style="font-size:25px;color:Orange;text-align:left">Commands</summary>

    -   `terraform plane -refresh=false`
    -   `terraform plane console`
    -   `terraform plane -out iam.tfplane`
    -   `terraform apply -var-file=file_name`
    -   `terraform apply -var="db_user=myuser" -var="db_pass=secretpassword"`
    -   `$ terraform workspace list`
    -   `$ terraform workspace new production`

    -   `$ terraform init`
    -   `$ terraform plan`
    -   `$ terraform console`
    -   `$ terraform apply -refresh=false`
    -   `$ terraform plan -out iam.tfplan`
    -   `$ terraform apply "iam.tfplan"`
    -   `$ terraform apply -target="aws_iam_user.tf_iam_user"`
    -   `$ terraform destroy`
    -   `$ terraform validate`
    -   `$ terraform fmt`
    -   `$ terraform show`
    -   `$ export TF_VAR_iam_user_name_prefix = FROM_ENV_VARIABLE_IAM_PREFIX`
    -   `$ export TF_VAR_iam_user_name_prefix=FROM_ENV_VARIABLE_IAM_PREFIX`
    -   `$ terraform plan -refresh=false -var="iam_user_name_prefix=VALUE_FROM_COMMAND_LINE"`
    -   `$ terraform apply -target=aws_default_vpc.default`
    -   `$ terraform apply -target=data.aws_subnet_ids.default_subnets`
    -   `$ terraform apply -target=data.aws_ami_ids.aws_linux_2_latest_ids`
    -   `$ terraform apply -target=data.aws_ami.aws_linux_2_latest`
    -   `$ terraform workspace show`
    -   `$ terraform workspace new prod-env`
    -   `$ terraform workspace select default`
    -   `$ terraform workspace list`
    -   `$ terraform workspace select prod-env`

    </details>

---

-   <details><summary style="font-size:25px;color:Orange;text-align:left">Terraform Directives</summary>

    In Terraform, **directives** are instructions or statements that define the configuration and behavior of resources, modules, and providers within the infrastructure as code (IaC) setup. They are used to specify how Terraform should interact with the cloud or on-prem infrastructure. Each directive plays a role in structuring the configuration files and managing dependencies, resource provisioning, and lifecycle management.

    1. **terraform**

        - The `terraform` directive is used to configure Terraform itself, such as backend settings (where the state files are stored) and version constraints.
        - This is usually found at the top of the configuration file.

        ```ini
        terraform {
            backend "s3" {
                bucket = "my-terraform-state"
                key    = "state/terraform.tfstate"
                region = "us-west-2"
            }
        }
        ```

    2. **provider**

        - The `provider` directive specifies which infrastructure provider (e.g., AWS, Azure, Google Cloud) Terraform should interact with.
        - It defines the connection details like region, authentication, and API version.

        - Providers are responsible for interacting with APIs and exposing resources for a specific infrastructure platform (e.g., AWS, Azure, Google Cloud).
        - Providers are declared in the configuration file to specify the target platform and set configuration details.

        ```ini
        provider "aws" {
            region = "us-west-2"
        }
        ```

    3. **resource**

        - The `resource` directive is used to define a specific infrastructure component such as compute instances, storage, or networks.
        - It declares the type of resource and its configuration parameters.

        - A representation of an infrastructure object (e.g., virtual machines, databases, networks) that Terraform manages.
        - Resources are declared with a resource type and a unique name, and they define the desired state of the infrastructure.

        ```ini
        resource "RESOURCE_TYPE" "RESOURCE_NAME" {
            # Configuration settings for the resource

            ATTRIBUTE_NAME = ATTRIBUTE_VALUE
            # Additional attribute configurations
        }
        ```

        ```ini
        resource "aws_instance" "example" {
            ami           = "ami-12345678"
            instance_type = "t2.micro"
        }
        ```

    4. **variable**

        - The `variable` directive allows you to declare input variables that can be used to parameterize Terraform configurations, making them reusable and flexible.
        - Variables can have default values, types, and descriptions.
        - A parameter that can be passed to Terraform configurations to make them more dynamic and reusable.
        - Variables are declared in the configuration and can be assigned values directly or through variable files.
        - Input variables let you customize aspects of Terraform modules without altering the module's own source code. This functionality allows you to share modules across different Terraform configurations, making your module composable and reusable.
        - When you declare variables in the root module of your configuration, you can set their values using CLI options and environment variables. When you declare them in child modules, the calling module should pass values in the module block.
        - Each input variable accepted by a module must be declared using a variable block

        ```ini
        variable "instance_type" {
            description = "Type of EC2 instance"
            type        = string
            default     = "t2.micro"
        }
        ```

    5. **locals**

        - The `locals` directive allows you to define local values, which are temporary and can be used within the configuration to reduce repetition or encapsulate logic.
        - These values are computed once and then reused throughout the configuration.
        - A local value assigns a name to an expression, so you can use the name multiple times within a module instead of repeating the expression.

        ```ini
        locals {
            instance_name = "web-server"
            environment   = "production"
        }
        ```

    6. **output**

        - The `output` directive defines the information to be output after the Terraform run. This can include IP addresses, resource IDs, or any other relevant data generated during resource creation.
        - It helps users access important details of their infrastructure easily.
        - Values that are optionally exported from a Terraform configuration, providing a way to share information with other configurations.
        - Outputs are defined using the `output` block and can be used to display or pass values between configurations.
        - Output values make information about your infrastructure available on the command line, and can expose information for other Terraform configurations to use. Output values are similar to return values in programming languages.

        ```ini
            output "instance_ip" {
            value = aws_instance.example.public_ip
        }
        ```

    7. **module**

        - The `module` directive allows you to reuse Terraform code by encapsulating related resources and logic into a module, which can be called from other configurations.
        - It helps in organizing and sharing infrastructure code.
        - A self-contained unit of Terraform configuration that represents a set of resources and can be reused.
        - Modules are defined using the module block and can be sourced locally or from external repositories.
        - A module is a container for multiple resources that are used together.
        - Every Terraform configuration has at least one module, known as its root module, which consists of the resources defined in the .tf files in the main working directory.
        - A module can call other modules, which lets you include the child module's resources into the configuration in a concise way. Modules can also be called multiple times, either within the same configuration or in separate configurations, allowing resource configurations to be packaged and re-used.
        - To call a module means to include the contents of that module into the configuration with specific values for its input variables. Modules are called from within other modules using module blocks:
        - A module in Terraform is a set of Terraform configuration files that define a specific set of infrastructure resources and settings. It encapsulates related resources and configurations, making them reusable across multiple Terraform configurations.

        ```ini
        module "network" {
            source = "./modules/network"
            vpc_id = "vpc-12345678"
        }
        ```

    8. **data**

        - The `data` directive is used to fetch or read data from external resources without creating or modifying them. This is useful for fetching details about existing infrastructure components (like AMIs, VPCs, etc.).

        ```ini
        data "aws_ami" "example" {
            most_recent = true
            owners      = ["amazon"]
            filter {
                name   = "name"
                values = ["amzn2-ami-hvm-*"]
            }
        }
        ```

    9. **lifecycle**

        - The `lifecycle` directive inside a resource block is used to define special lifecycle management behaviors, such as preventing resource deletion or defining creation-time dependencies.

        ```ini
        resource "aws_s3_bucket" "example" {
            bucket = "my-bucket"
            lifecycle {
                prevent_destroy = true
            }
        }
        ```

    10. **provisioner**: The provisioner directive allows you to execute scripts or commands on a resource after it has been created or updated. Provisioners are typically used to configure resources (such as virtual machines) beyond the basic setup provided by the Terraform resource block. This might include installing software, configuring files, or setting up the environment after an instance or other resource is provisioned.

        ```ini
        provisioner "remote-exec" {
            inline = ["echo 'Wait until SSH is ready'"]

            connection {
            type        = "ssh"
            user        = local.ssh_user
            private_key = file(local.private_key_path)
            host        = aws_instance.nginx.public_ip
            }
        }
        provisioner "local-exec" {
            command = "ansible-playbook  -i ${aws_instance.nginx.public_ip}, --private-key ${local.private_key_path} nginx.yaml"
        }
        ```

    </details>

---

-   <details><summary style="font-size:25px;color:Orange;text-align:left">Terms & Concepts</summary>

    -   **Terraform Configuration**:

        -   A set of files written in HashiCorp Configuration Language (HCL) that describe the desired infrastructure state.
        -   The main configuration file is usually named `main.tf` and contains resource definitions, providers, variables, and other settings.
        -   In Terraform, several files are automatically generated to manage and track the state of your infrastructure, handle locks, and ensure consistent operations. These files are critical to the functionality of Terraform, ensuring that the infrastructure is created, updated, and destroyed correctly.

            -   **terraform.tfstate**:

                -   This file stores the current state of your infrastructure. It includes details about the resources that Terraform manages, their current configuration, and metadata.
                -   It's usually in JSON format and can be quite large, depending on the size and complexity of your infrastructure.
                -   It Should be stored securely because it contains sensitive information about your infrastructure.

            -   **terraform.tfstate.backup**:

                -   This file is a backup of the previous state. Before Terraform makes changes to your infrastructure, it creates a backup of the existing state in this file.
                -   It's useful in case something goes wrong during an apply, and you need to roll back to the previous state.
                -   While it's good to keep a backup, you might not want to version control it, especially if it contains sensitive information. Ensure it's stored securely.

            -   **terraform.lock.hcl**:

                -   This file is related to Terraform's dependency locking mechanism. It's used to lock down the versions of providers and modules to ensure that subsequent runs use the same versions as the original deployment.
                -   It's generally used in conjunction with terraform init and is crucial for ensuring consistency in a team or CI/CD environment.
                -   This file should be version controlled along with your Terraform configuration files. It ensures that everyone working on the project uses the same versions of providers and modules.

    -   **Infrastructure as Code (IaC)**:

        -   IaC is a methodology where infrastructure is defined and managed using code, allowing for versioning, automation, and consistency.
        -   Terraform is a popular cloud agnostic IaC tool used to provision, version, and manage infrastructure in a declarative manner.

    -   **Terraform CLI**:

        -   The command-line interface for interacting with Terraform, enabling users to apply, plan, and destroy infrastructure.
        -   Commands: Common commands include terraform init, terraform plan, terraform apply, and terraform destroy.

    -   **Terraform Cloud**:

        -   A hosted service by HashiCorp that provides collaboration, versioning, and automation features for Terraform configurations.
        -   Usage: Terraform Cloud facilitates remote execution of Terraform runs, workspace management, and collaboration among team members.

    #### Blocks:

    -   A block is a structural unit of configuration that defines specific behavior or configuration for resources, providers, modules, and other components. Blocks in Terraform contain settings or instructions in a declarative format and are the building blocks of a Terraform configuration file.
    -   Each block typically starts with a keyword (e.g., `resource`, `provider`, `variable`, etc.), followed by parameters or attributes that define the desired state or configuration for that specific entity. These blocks can be nested and often contain other blocks or key-value pairs.

    -   **Key Elements of a Block**:

        -   `Block Type`: The keyword that defines what kind of entity the block is configuring (e.g., `resource`, `provider`, `output`, etc.).
        -   `Block Label(s)`: Identifies the specific instance or name of the entity.
        -   `Attributes/Arguments`: Key-value pairs or other configurations inside the block that describe the properties of the entity.
        -   `Nested Blocks`: Other blocks inside a block that further refine its configuration.

    -   [Resource Block](https://developer.hashicorp.com/terraform/language/resources)

        ```ini
        resource "aws_instance" "example" {
            ami = "abc123"

            network_interface {
                # ...
            }
        }
        ```

    -   **[Data Block](https://developer.hashicorp.com/terraform/language/data-sources)** Block: In Terraform, the data block is used to retrieve and expose data from various sources, such as cloud providers, external APIs, or other Terraform-managed resources. The data retrieved using a data block can then be used within the Terraform configuration to make decisions, configure resources, or provide input values.

        -   In Terraform, the data specified within a data block is retrieved during the planning phase of the Terraform workflow. Specifically, the data retrieval occurs when Terraform executes the `terraform plan`, `terraform apply`, or `terraform refresh` commands. Here's how the data retrieval process works:

        -   `Plan Phase`:

            -   During the plan phase (terraform plan), Terraform examines the configuration files and determines the actions necessary to achieve the desired state described in the configuration.
            -   When Terraform encounters a data block, it evaluates the configuration settings specified within the block to determine how to retrieve the requested data.
            -   Terraform builds a dependency graph based on the relationships between resources and data sources, ensuring that data retrieval occurs in the correct order.

        -   `Data Retrieval`:

            -   Once Terraform has determined the dependencies and the order in which data sources should be queried, it begins the data retrieval process.
            -   Terraform communicates with the appropriate data sources (e.g., cloud providers, external APIs) based on the configuration settings specified within the data block.
            -   The data is retrieved from the sources and stored in memory within the Terraform process.

        -   `Dependency Resolution`:

            -   If a data block depends on other resources or data sources, Terraform ensures that those dependencies are resolved first before retrieving the data.
            -   For example, if a data block depends on an AWS VPC, Terraform will first ensure that the VPC resource is created or retrieved before attempting to query other data sources related to the VPC.

        -   `Plan Generation`:

            -   After retrieving the necessary data, Terraform incorporates that data into the plan it generates.
            -   The plan includes any changes or actions required to achieve the desired state described in the configuration, including the use of the retrieved data in resource configurations or other parts of the configuration.

        -   `Apply Phase`:

            -   During the apply phase (terraform apply), Terraform executes the actions specified in the plan, including the creation, modification, or deletion of resources, and applies any changes to the infrastructure.

    #### Meta-Arguments

    In Terraform, a **meta-argument** is a special argument that can be used with resources to control aspects of how those resources are managed rather than specifying properties of the resource itself. Meta-arguments give more control over lifecycle, dependencies, and iteration.

    1. **count**: The `count` meta-argument allows you to create multiple instances of a resource based on a given number.

        ```ini
        resource "aws_instance" "example" {
            count         = 3  # Creates 3 instances
            ami           = "ami-0c55b159cbfafe1f0"
            instance_type = "t2.micro"

            tags = {
                Name = "ExampleInstance-${count.index}"
            }
        }
        ```

        - In this example, Terraform creates 3 instances. The `count.index` is used to give each instance a unique name tag like `ExampleInstance-0`, `ExampleInstance-1`, and `ExampleInstance-2`.

    2. **for_each**: The `for_each` meta-argument allows you to create resources based on a map or a set, where each item is uniquely identified by a key.

        ```ini
        resource "aws_instance" "example" {
            for_each      = {
                "web" = "ami-0c55b159cbfafe1f0"
                "db"  = "ami-0a313d6098716f372"
            }
            ami           = each.value
            instance_type = "t2.micro"

            tags = {
                Name = "ExampleInstance-${each.key}"
            }
        }
        ```

        - In this example, Terraform creates two instances with different AMIs, one for `web` and one for `db`. Each instance gets a tag name of either `ExampleInstance-web` or `ExampleInstance-db`.

    3. **provider**: The `provider` meta-argument specifies which provider configuration should be used for a particular resource. This is useful if multiple provider configurations are defined.

        ```ini
        provider "aws" {
            alias  = "us_east"
            region = "us-east-1"
        }

        provider "aws" {
            alias  = "us_west"
            region = "us-west-2"
        }

        resource "aws_instance" "example" {
            provider      = aws.us_east  # Use the `us_east` provider configuration
            ami           = "ami-0c55b159cbfafe1f0"
            instance_type = "t2.micro"
        }
        ```

        - Here, Terraform uses the `us_east` provider configuration for this specific instance, even though other provider configurations are defined.

    4. **depends_on**: The `depends_on` meta-argument explicitly specifies dependencies for a resource. This ensures that the resource is created only after the specified dependencies have been created.

        ```ini
        resource "aws_security_group" "example_sg" {
        # Security group configuration
        }

        resource "aws_instance" "example_instance" {
            ami           = "ami-0c55b159cbfafe1f0"
            instance_type = "t2.micro"
            depends_on    = [aws_security_group.example_sg]  # Ensure SG is created first
        }
        ```

        - In this example, `example_instance` will only be created after `example_sg` has been created, ensuring proper ordering.

    5. **lifecycle**: The `lifecycle` meta-argument controls how Terraform manages changes to resources, including preventing deletion or customizing behavior during updates.

        ```ini
        resource "aws_instance" "example" {
            ami           = "ami-0c55b159cbfafe1f0"
            instance_type = "t2.micro"

            lifecycle {
                create_before_destroy = true  # Replace old instance only after new one is created
                prevent_destroy       = true  # Prevent accidental deletion
            }
        }
        ```

        - Here, `create_before_destroy` ensures that if an update requires replacement, the new resource is created before the old one is destroyed. `prevent_destroy` protects this instance from being accidentally deleted.

    6. **provisioner**: The `provisioner` meta-argument allows you to run scripts or commands on a resource after it has been created or destroyed. Common provisioners include `local-exec` (runs on the local machine) and `remote-exec` (runs on the remote resource).

        ```ini
        resource "aws_instance" "example" {
            ami           = "ami-0c55b159cbfafe1f0"
            instance_type = "t2.micro"

            provisioner "local-exec" {
                command = "echo ${self.private_ip} > instance_ip.txt"
            }
        }
        ```

    </details>

---

-   <details><summary style="font-size:25px;color:Orange;text-align:left">Hashicorp Configuration Language(HCL)</summary>

    -   [Terraform Configuration Syntex](https://developer.hashicorp.com/terraform/language/syntax/configuration)

    -   `Arguments`: An argument assigns a value to a particular name:

        ```ini
        image_id = "abc123"
        ```

        -   The identifier before the equals sign is the argument name, and the expression after the equals sign is the argument's value.

    -   `Identifiers`:

        -   Argument names, block type names, and the names of most Terraform-specific constructs like resources, input variables, etc. are all identifiers.
        -   Identifiers can contain letters, digits, underscores (`_`), and hyphens (`-`). The first character of an identifier must not be a digit, to avoid ambiguity with literal numbers.

    -   `Comments`: The Terraform language supports three different syntaxes for comments:

        -   `#` begins a single-line comment, ending at the end of the line.
        -   `//` also begins a single-line comment, as an alternative to `#`.
        -   `/*` and `*/` are start and end delimiters for a comment that might span over multiple lines.

    -   [`Modules`, `Variables` and `Outputs`](https://developer.hashicorp.com/terraform/language/values): If you're familiar with traditional programming languages, it can be useful to compare Terraform's

        -   `modules` to function definitions.
        -   `Input` variables are like function arguments.
        -   `Output` values are like function return values.
        -   `Local` values are like a function's temporary local variables.

    -   [Expressions in HCL](https://developer.hashicorp.com/terraform/language/expressions):

        -   **Other expression types:**

            -   For expressions
            -   Splat expressions
            -   Dynamic blocks
            -   Type constraints
            -   Version constraints

    -   [Meta-Arguments]()

    #### Collections

    1. `Lists`:

        - Lists define ordered collections of values. Example:

        ```ini
        # Declare a list of availability zones
        variable "availability_zones" {
            type    = list(string)
            default = ["us-west-2a", "us-west-2b", "us-west-2c"]
        }
        ```

    2. `Maps`:

        - Maps allow you to create key-value pairs for organizing and accessing data. Example:

        ```ini
        # Declare a map for tags
        variable "tags" {
            type    = map(string)
            default = { "env" : "dev", "app" : "web" }
        }
        ```

    3. `For Each`:

        - The for_each expression is used for resource iteration. Example:

        ```ini
        # Use for_each to create multiple instances of an AWS EC2 instance
        resource "aws_instance" "example" {
            for_each = toset(["a", "b", "c"])

            ami           = "ami-0c55b159cbfafe1f0"
            instance_type = "t2.micro"
        }

        # Define a set of instance names
        variable "instance_names" {
            type    = set(string)
            default = ["web", "db", "cache"]
        }

        # Create multiple instances using for_each
        resource "aws_instance" "example" {
            for_each = var.instance_names

            ami           = "ami-12345678"
            instance_type = "t2.micro"
            tags = {
                Name = each.key
            }
        }

        # Access set elements in a resource
        resource "aws_instance" "example" {
            for_each = var.instance_names

            ami           = "ami-12345678"
            instance_type = "t2.micro"
            tags = {
                Name = each.key
            }
        }


        # Define a map of instance configurations
        variable "instance_configurations" {
            type = map(object({
                ami           = string
                instance_type = string
            }))
            default = {
                web   = { ami = "ami-12345678", instance_type = "t2.micro" }
                db    = { ami = "ami-87654321", instance_type = "t2.small" }
                cache = { ami = "ami-56781234", instance_type = "t2.nano" }
            }
        }

        # Create multiple instances using for_each
        resource "aws_instance" "example" {
            for_each = var.instance_configurations

            ami           = each.value.ami
            instance_type = each.value.instance_type
            tags = {
                Name = each.key
            }
        }
        ```

    #### [Built-in Functions](https://developer.hashicorp.com/terraform/language/functions)

    </details>

---

-   <details><summary style="font-size:25px;color:Orange;text-align:left">Terraform Interview Questions</summary>

    #### Terraform Fundamentals

    <details><summary style="font-size:18px;color:#C71585">What is Terraform, and why is it used?</summary>

    **Terraform** is an open-source **Infrastructure as Code (IaC)** tool developed by HashiCorp that allows users to define, provision, and manage infrastructure resources in a declarative manner. Terraform enables the automation of infrastructure across various cloud platforms, data centers, and other service providers.

    ##### Why Terraform is Used:

    1. **Infrastructure as Code (IaC)**:

        - Terraform enables users to define infrastructure using **declarative configuration files** (written in HashiCorp Configuration Language, HCL, or JSON).
        - These files describe the desired state of your infrastructure, and Terraform ensures that this state is achieved and maintained.

    2. **Multi-Cloud and Multi-Provider Support**:

        - Terraform supports a wide range of cloud providers such as **AWS**, **Azure**, **Google Cloud**, and many others.
        - It also integrates with services and platforms like Kubernetes, GitHub, Datadog, etc., allowing you to manage diverse infrastructure in a unified way.

    3. **Declarative and Consistent**:

        - In a declarative approach, users define the desired outcome (e.g., "I want 3 EC2 instances"), and Terraform takes care of making it happen, rather than writing out step-by-step instructions.
        - Terraform manages the **dependency graph** of resources, ensuring that resources are created, updated, or destroyed in the correct order.

    4. **Automation and Orchestration**:

        - Terraform automates the provisioning, scaling, and de-provisioning of infrastructure resources.
        - It simplifies complex tasks by allowing users to define reusable modules, automatically handling configuration drift, and tracking dependencies across resources.

    5. **State Management**:

        - Terraform uses a **state file** (`terraform.tfstate`) to track the current state of the infrastructure. This allows Terraform to understand what changes need to be made in the infrastructure to match the desired state defined in the configuration.
        - This state can be stored locally or remotely (e.g., in S3, Terraform Cloud, etc.) for better collaboration and consistency.

    6. **Plan and Apply Workflow**:

        - Terraform allows users to **plan** changes before applying them with the `terraform plan` command, giving a detailed view of what actions will be taken (creating, modifying, or destroying resources).
        - After reviewing the plan, users can apply the changes with the `terraform apply` command, ensuring a controlled and auditable process for modifying infrastructure.

    7. **Version Control and Collaboration**:

        - Since infrastructure is defined as code, Terraform files can be stored in version control systems (such as Git), enabling versioning, collaboration, and auditing.
        - Teams can collaborate on infrastructure changes using pull requests, code reviews, and other version control practices.

    8. **Modularity and Reusability**:

        - Terraform allows users to create **modules** (collections of resources) that can be reused across different environments, projects, or teams, ensuring consistency and reducing duplication.

    9. **Provisioning Across Environments**:

        - Terraform can be used to manage infrastructure for **development**, **staging**, and **production** environments using the same codebase, enabling consistency and reducing configuration drift between environments.

    10. **Extensibility**:
        - Terraform supports **custom providers** and can be extended with plugins, making it highly flexible to manage infrastructure across various types of services or custom environments.

    ##### Example Terraform Use Cases:

    -   **Provisioning cloud resources** like virtual machines, networks, databases, and load balancers.
    -   **Managing multi-cloud infrastructure** by provisioning resources across AWS, GCP, and Azure in a unified way.
    -   **Creating and managing Kubernetes clusters** and deploying applications on them.
    -   **Managing infrastructure as code** for development, testing, and production environments with version control.
    -   **Automating infrastructure changes** and reducing manual intervention in infrastructure scaling or decommissioning.

    ##### Key Benefits of Terraform:

    -   **Consistency**: Ensures your infrastructure is always configured the way you want it to be.
    -   **Scalability**: Manages large-scale infrastructure and automates scaling as your needs grow.
    -   **Collaborative**: With version control, teams can work together on infrastructure changes, just like application code.
    -   **Infrastructure Auditing**: Every change is tracked and can be reviewed before being applied, leading to better governance and security.

    </details>

    <details><summary style="font-size:18px;color:#C71585">How do you handle dependency management between Terraform resources?</summary>

    -   Terraform automatically manages dependencies between resources. It understands the order in which resources need to be created or updated.

    </details>

    <details><summary style="font-size:18px;color:#C71585">Explain the concept of idempotency in Terraform.</summary>

    Idempotency ensures that running the same Terraform configuration multiple times results in the same infrastructure state, regardless of the initial state.

    </details>

    <details><summary style="font-size:18px;color:#C71585">What is the purpose of terraform block in Terraform configuration?</summary>

    The `terraform block` is a top-level configuration block that is used to define settings and configurations for Terraform itself. It is not directly related to the infrastructure being provisioned but rather controls how Terraform operates.

    In Terraform, the `terraform` block is a top-level configuration block that is used to define settings and configurations for Terraform itself. It is not directly related to the infrastructure being provisioned but rather controls how Terraform operates.

    1. **Specifying Backend Configuration**:
        - The `backend` section within the `terraform` block defines where Terraform stores the **state file**.
        - Backends can be local (default) or remote (e.g., S3, Azure Blob Storage, Google Cloud Storage).
    2. **Defining Required Providers**: The `required_providers` block specifies which providers Terraform will use, including their source and version constraints.
    3. **Setting Required Terraform Version**: The `required_version` attribute ensures that the Terraform configuration is compatible with a specific version or range of Terraform versions.
    4. **Enabling Experiments or Features**: Used to enable experimental features or feature flags in Terraform.
    5. **Using Terraform Cloud or Enterprise**: Configuration to use Terraform Cloud or Enterprise for remote operations and state management.
    6. **Controlling Dependency Lock Files**: Terraform uses a lock file (`.terraform.lock.hcl`) to record the provider versions being used. The `terraform` block can define settings for this behavior indirectly through provider configuration.

    -   **Example Full `terraform` Block**:

        ```ini
        terraform {
        required_version = ">= 1.3.0"

        backend "s3" {
            bucket         = "my-terraform-state"
            key            = "state/terraform.tfstate"
            region         = "us-east-1"
        }

        required_providers {
            aws = {
            source  = "hashicorp/aws"
            version = "~> 4.0"
            }
        }
        }
        ```

    -   In summary, The `terraform` block is primarily used to:
        -   Configure backend storage for the state file.
        -   Define provider dependencies.
        -   Set version constraints for Terraform.
        -   Enable features or manage Terraform Cloud/Enterprise settings.

    </details>

    <details><summary style="font-size:18px;color:#C71585">What is the purpose of Terraform providers?</summary>

    Providers in Terraform are responsible for understanding and interacting with APIs of specific infrastructure platforms. The "aws" provider, for example, manages resources on AWS.

    </details>

    <details><summary style="font-size:18px;color:#C71585">What is the Terraform configuration file, and what extension does it have?</summary>

    A Terraform configuration file is a script or a set of files written in HashiCorp Configuration Language (HCL) that defines the infrastructure and resources to be provisioned or managed by Terraform. These files typically have a `*.tf` extension. The configuration specifies the infrastructure components, their relationships, configurations, and other details necessary for provisioning and managing infrastructure.

    </details>

    <details><summary style="font-size:18px;color:#C71585">Explain the perpose of the <b>terraform init</b>, <b>terraform plan</b>, <b>terraform apply</b>, <b>terraform destroy</b> commands.</summary>

    -   `terraform init`: Initializes the Terraform working directory, downloading necessary provider plugins and configuring the backend.
    -   `terraform plan`: Creates an execution plan, displaying the changes Terraform will apply to the infrastructure without actually making modifications.
    -   `terraform apply`: Applies the planned changes to the infrastructure, creating or updating resources according to the Terraform configuration.
    -   `terraform destroy`: Initiates the destruction of provisioned resources, reverting the infrastructure to its pre-deployment state.

    </details>

    <details><summary style="font-size:18px;color:#C71585">Explain the purpose of the <b>terraform.tfstate</b>, <b>terraform.tfstate.backup</b>, and <b>terraform.lock.hcl</b> file.</summary>

    -   **terraform.tfstate**: It is the default Terraform state file that records the current state of the infrastructure managed by Terraform, including resource metadata, dependencies, and attribute values
    -   **terraform.tfstate.backup**: A backup of the previous state file (terraform.tfstate) created automatically before each terraform apply, providing a fallback in case of accidental data loss or errors during the apply process.
    -   **terraform.lock.hcl**: The `terraform.lock.hcl` file is a lock file generated by Terraform when using Terraform 0.14 and later versions. It is used to lock the versions of providers and modules used in a Terraform configuration to ensure reproducibility and consistency across different environments and executions.

        -   `Purpose`:

            -   The `terraform.lock.hcl` file records the exact versions of providers and modules used in a Terraform configuration when it is initialized or updated.
            -   It serves as a lock file to freeze the versions of dependencies, preventing unexpected changes in the versions of providers and modules during subsequent executions.

        -   `Usage`:

            -   When running `terraform init`, Terraform checks for the presence of the `terraform.lock.hcl` file in the working directory.
            -   If the lock file exists, Terraform installs the exact versions of providers and modules specified in the file, ensuring that the same versions are used consistently across environments.
            -   If the lock file does not exist, Terraform generates one based on the current configuration and installed versions of providers and modules.

        -   `Managing Dependencies`:

            -   The `terraform.lock.hcl` file simplifies dependency management by providing a deterministic way to specify and track dependencies.
            -   It helps avoid unexpected changes in dependencies due to updates or changes in upstream sources, ensuring that infrastructure deployments are reproducible and reliable.

        -   By using the `terraform.lock.hcl` file, Terraform users can achieve greater confidence in the consistency and reliability of their infrastructure deployments, as it helps ensure that the same versions of providers and modules are used across different environments and executions.

    </details>

    <details><summary style="font-size:18px;color:#C71585">What is Terraform backend? Explain the purpose of Terraform Backends.</summary>

    -   Terraform backend is a configuration block that defines where and how Terraform stores its state files. The state file contains information about the infrastructure managed by Terraform, such as resource metadata, dependencies, and attribute values.
    -   There are various types of backends supported by Terraform, including local, remote, and enhanced backends. Some popular backends include:

        -   `Local Backend`: Stores the state file on the local disk. This is the default if no backend configuration is provided. It is suitable for solo developers working on small projects.
        -   `Remote Backends` (e.g., Amazon S3, Azure Storage, Google Cloud Storage): Store the state file remotely, allowing collaboration and better management of infrastructure. Remote backends often include additional features like state locking to prevent conflicts during concurrent operations.
        -   `Terraform Cloud/Enterprise Backend`: Terraform Cloud and Terraform Enterprise are managed services that provide collaboration features, remote state storage, and other enterprise-level capabilities.

    </details>

    <details><summary style="font-size:18px;color:#C71585">What is Terraform remote state, and why is it used?</summary>

    **Terraform remote state** refers to storing the state file (`terraform.tfstate`) in a remote location rather than on the local filesystem. This allows multiple users and systems to access and work with the state in a shared environment, facilitating collaboration and improving consistency.

    ##### Why Terraform Remote State is Used:

    1. **Collaboration**:

        - When multiple team members are working on the same infrastructure, having a **shared state** is essential. Local state files are isolated and do not reflect changes made by others, leading to inconsistencies. Remote state allows all team members to work with the same, up-to-date state.
        - For example, if one user provisions a resource and another user runs Terraform commands locally, the latter might inadvertently overwrite the existing resources. Remote state ensures everyone uses the latest state of the infrastructure.

    2. **State Locking**:
        - Remote state storage typically supports **state locking**, which prevents multiple users from modifying the state file at the same time. This helps avoid conflicts and ensures that only one `terraform apply` operation runs at a time.
        - When a user starts running Terraform operations, the state is locked until the operation completes. This locking mechanism is crucial for preventing race conditions and state corruption in collaborative environments.
    3. **Security**:

        - Local state files may contain **sensitive information**, such as secrets, credentials, or access keys. Storing the state file remotely in a secure environment (e.g., an S3 bucket with encryption and access control) is a best practice to avoid security risks associated with exposing sensitive data.
        - In a remote setup, you can enforce encryption at rest and in transit, access control policies, and audit logging to secure the state file properly.

    4. **Consistency Across Environments**:

        - Remote state ensures that different environments (e.g., development, staging, production) share the correct state files for their respective configurations. This reduces the risk of applying changes to the wrong environment, which can occur if state files are managed locally.

    5. **Team Collaboration in CI/CD Pipelines**:

        - When using CI/CD pipelines to automate infrastructure changes, storing state remotely ensures that pipeline jobs and other users have access to the latest state.
        - For example, when running automated tests or deployments in a pipeline, remote state ensures that the infrastructure matches the desired configuration and that all jobs work from the same infrastructure state.

    6. **Backups and Recovery**:
        - Remote backends like S3, GCS, or Terraform Cloud can be configured to automatically create **versioned backups** of your state files, making it easy to roll back if something goes wrong or if state corruption occurs.

    ##### Common Backends for Remote State:

    Terraform supports a wide variety of **remote backends** for storing state, some of the most commonly used ones include:

    -   **Amazon S3** (with DynamoDB for state locking)
    -   **Google Cloud Storage (GCS)**
    -   **Azure Blob Storage**
    -   **HashiCorp's Terraform Cloud/Enterprise**
    -   **Consul**
    -   **PostgreSQL**
    -   **Artifactory**

    ##### Example of Configuring Remote State in Terraform:

    Here’s how you can configure remote state with **Amazon S3** as the storage backend and **DynamoDB** for state locking.

    ```ini
    terraform {
    backend "s3" {
        bucket         = "my-terraform-state-bucket"
        key            = "project/terraform.tfstate"
        region         = "us-west-2"
        encrypt        = true
        dynamodb_table = "terraform-state-lock"
    }
    }
    ```

    ###### Explanation:

    -   **`bucket`**: The S3 bucket where the state file will be stored.
    -   **`key`**: The path to the state file in the bucket (useful if multiple projects share the same bucket).
    -   **`region`**: The AWS region where the bucket resides.
    -   **`encrypt`**: Ensures the state file is encrypted at rest in S3.
    -   **`dynamodb_table`**: Specifies the DynamoDB table to use for state locking, preventing concurrent state modifications.

    ##### Benefits of Remote State:

    1. **Centralized Management**: Remote state ensures a single source of truth for the infrastructure's current state, avoiding discrepancies and making it easier to manage the infrastructure lifecycle across teams and environments.
    2. **Locking and Concurrency**: With state locking, it avoids the risk of multiple users or processes modifying the state simultaneously, preventing potential conflicts and corruption.
    3. **Security and Access Control**: Sensitive data is securely stored and managed in a centralized, secure backend, allowing for better access control, encryption, and audit logging.
    4. **Collaboration**: Facilitates collaboration by allowing multiple team members to access and modify infrastructure using the same state file, ensuring consistency across their work.
    5. **Consistency Across Environments**: Remote state enables consistent infrastructure management across different environments (e.g., development, staging, production).

    ##### Use Cases for Remote State:

    -   **Team Collaboration**: In teams where multiple engineers work on the same infrastructure project.
    -   **CI/CD Pipelines**: For automated workflows, remote state ensures consistent access to the latest state across pipeline jobs.
    -   **Production Infrastructure**: Remote state is essential when managing critical infrastructure that requires versioned state, security, and auditability.
    -   **Multi-Environment Setup**: Managing different environments (development, staging, production) and ensuring that each environment has its own consistent state file.

    ##### Summary:

    **Terraform remote state** allows the state file to be stored in a shared, secure, and centralized location rather than locally. It enables collaboration, prevents state corruption through locking, and improves security by supporting secure backends like S3, GCS, or Terraform Cloud. Remote state is crucial for managing large-scale infrastructure with multiple users or in production environments where consistency and security are vital.

    </details>

    <details><summary style="font-size:18px;color:#C71585">How does Terraform handle secrets or sensitive information?</summary>

    Terraform provides the sensitive argument for variables to mark sensitive information. Secrets can also be stored in environment variables.

    Terraform provides several mechanisms for handling secrets or sensitive information securely:

    -   **Sensitive Data Handling**: Terraform offers the sensitive argument to mark sensitive values within resources. When a value is marked as sensitive, Terraform will prevent it from being displayed in the plan or any output, including state files.

        ```ini
        resource "aws_secretsmanager_secret" "example" {
            name = "example"
            secret_string = "super_secret_value"
            sensitive = true
        }
        ```

    -   **Backend Configuration**: Terraform's backend configuration can be used to specify where state data is stored. It is recommended to use a backend that supports encryption and access control, such as Amazon S3 with server-side encryption enabled.

        ```ini
        terraform {
            backend "s3" {
                bucket = "example-bucket"
                key = "terraform/state.tfstate"
                region = "us-east-1"
                dynamodb_table = "terraform-lock"
                encrypt = true
            }
        }
        ```

    -   **Input Variables and Environment Variables**: Input variables can be defined in Terraform configuration files to parameterize configurations. When sensitive information is required as input, it is recommended to use environment variables or input variables defined in separate files that are not checked into source control.

        ```ini
        variable "db_password" {
            type = string
            default = ""
        }
        ```

    -   **Provider Credentials**: Provider credentials, such as AWS access keys or Azure Service Principal credentials, should be managed using secure mechanisms provided by the respective cloud provider. For example, AWS IAM roles or Azure Managed Identities can be used to provide credentials securely without exposing them in Terraform configuration files.
    -   **Secrets Management Integration**: Terraform integrates with third-party secrets management solutions, such as HashiCorp Vault or AWS Secrets Manager, to manage sensitive information securely. These solutions can be used to store and retrieve secrets dynamically during Terraform execution.

        ```ini
        data "aws_secretsmanager_secret" "example" {
            name = "example"
        }

        resource "aws_db_instance" "example" {
        # ...
            password = data.aws_secretsmanager_secret.example.secret_string
        }
        ```

    By leveraging these mechanisms, Terraform enables secure handling of secrets and sensitive information, reducing the risk of exposure and ensuring compliance with security best practices.

    </details>

    <details><summary style="font-size:18px;color:#C71585">How do you handle rolling updates or blue-green deployments using Terraform?</summary>

    Terraform provides features like count and launch_template to manage rolling updates or blue-green deployments.

    </details>

    <details><summary style="font-size:18px;color:#C71585">What is the terraform import command? How is it used</summary>

    -   The terraform import command in Terraform is used to bring an existing resource under Terraform management. This is particularly useful when you have infrastructure that was created outside of Terraform, and you want to start managing it using Terraform without recreating or modifying the resource.
    -   `$ terraform import aws_instance.example i-0c1234567890abcdef`
    -   After running terraform import, Terraform will create an entry in the state file (terraform.tfstate) for the imported resource. However, this doesn't automatically generate a Terraform configuration for the resource. You'll need to manually write the Terraform configuration to match the existing resource's configuration.
    -   Once the resource is imported and you've created a corresponding Terraform configuration, you can use Terraform commands like terraform plan and terraform apply to manage the resource going forward.
    -   Keep in mind that not all resources are fully importable, and you might need to manually configure additional settings in your Terraform configuration to match the existing resource's configuration. Always refer to the Terraform documentation for specifics on each resource type.

---

    The `terraform import` command is used in Terraform to bring an existing resource under Terraform management. This is useful when you have resources created outside Terraform (e.g., manually through a cloud provider's console) but want to manage them with Terraform going forward without recreating them.

    -   **Basic Syntax**

        -   `$ terraform import <resource_type>.<resource_name> <resource_id>`

            -   `resource_type` -> The type of resource in Terraform (e.g., `aws_instance`, `azurerm_resource_group`).
            -   `resource_name` -> The name you want to assign to the resource in Terraform configuration.
            -   `resource_id` -> The unique identifier of the resource in the cloud provider.

    -   **Steps for Importing a Resource**

        1. `Write the Configuration`: Define the resource configuration in your Terraform files. This configuration will tell Terraform what type of resource you want to import.
        2. `Run the Import Command`: Use `terraform import` with the appropriate arguments.
        3. `Verify the Import`: Run `terraform plan` to see the imported resource's state.

    -   **Example**: Suppose you have an existing AWS S3 bucket named `my-bucket` created manually, and you want to import it into your Terraform configuration.

        1. `Write the Configuration`: Create a configuration file (`main.tf`) with the following contents:

            ```ini
            resource "aws_s3_bucket" "my_bucket" {
            bucket = "my-bucket"
            }
            ```

        2. `Run the Import Command`: Now, use the `terraform import` command to bring the bucket under Terraform’s management.

            - `$ terraform import aws_s3_bucket.my_bucket my-bucket`

            - `aws_s3_bucket` is the resource type.
            - `my_bucket` is the resource name in your Terraform configuration.
            - `my-bucket` is the actual name of the S3 bucket.

        3. `Verify the Import`: After importing, run:

            - `$ terraform plan`

    Terraform should show the imported state without any changes, indicating that the resource is now managed by Terraform.

    </details>

    #### Terraform Best Practices

    <details><summary style="font-size:18px;color:#C71585">Explain the purpose of Terraform workspaces.</summary>

    -   Workspaces allow you to manage multiple environments (dev, prod, staging) within a single Terraform configuration. Each workspace maintains its own state.

    </details>

    <details><summary style="font-size:18px;color:#C71585">How can you organize Terraform configurations for better modularity?</summary>

    -   Use modules to organize Terraform configurations into reusable components. Modules encapsulate related resources and can be shared across projects.

    </details>

    <details><summary style="font-size:18px;color:#C71585">Why is it important to use variables in Terraform?</summary>

    -   Variables in Terraform allow you to parameterize configurations, making them more flexible, reusable, and easier to maintain.

    </details>

    #### Infrastructure as Code Principles

    <details><summary style="font-size:18px;color:#C71585">What are the benefits of Infrastructure as Code (IaC) principles?</summary>

    -   IaC brings benefits like version control, repeatability, and automation to infrastructure provisioning, reducing manual errors and promoting collaboration.

    </details>

    #### Troubleshooting Terraform

    <details><summary style="font-size:18px;color:#C71585">How can you troubleshoot Terraform errors?</summary>

    -   Review Terraform's error messages, check the configuration for syntax errors, and use the terraform console or terraform fmt commands for debugging.

    </details>

    <details><summary style="font-size:18px;color:#C71585">What does Terraform's taint command do?</summary>

    The terraform taint command marks a resource for recreation on the next terraform apply, forcing Terraform to destroy and recreate the resource.

    </details>

    #### AWS-Specific Terraform Questions

    <details><summary style="font-size:18px;color:#C71585">How do you authenticate Terraform with AWS?</summary>

    -   AWS credentials can be provided via environment variables (AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY) or through AWS CLI configuration.

    </details>

    <details><summary style="font-size:18px;color:#C71585">What is an AWS IAM role, and how can you create it using Terraform?</summary>

    -   An IAM role in AWS defines a set of permissions. It can be created using Terraform's aws_iam_role resource.

    </details>

    <details><summary style="font-size:18px;color:#C71585">How can you create a Virtual Private Cloud (VPC) in AWS using Terraform?</summary>

    -   Use the aws_vpc resource to define a VPC in Terraform.

    </details>

    <details><summary style="font-size:18px;color:#C71585">Explain the purpose of security groups in AWS, and how can you create them using Terraform?</summary>

    -   Security groups control inbound and outbound traffic. They can be created using Terraform's aws_security_group resource.

    </details>

    <details><summary style="font-size:18px;color:#C71585">How can you use Terraform to create an Auto Scaling Group in AWS?</summary>

    -   Use the aws_autoscaling_group resource to define an Auto Scaling Group in Terraform.

    </details>

    <details><summary style="font-size:18px;color:#C71585">What is AWS Elastic Load Balancer (ELB), and how can you configure it with Terraform?</summary>

        -   ELB distributes incoming traffic across multiple targets. It can be configured using Terraform's aws_lb and aws_lb_target_group resources.

    </details>

    <details><summary style="font-size:18px;color:#C71585">Explain the difference between declarative and imperative programming in the context of Terraform.</summary>

    In the context of Terraform, **declarative** and **imperative** programming paradigms represent two different approaches to defining and managing infrastructure.

    ##### Declarative Programming in Terraform

    Terraform primarily follows the **declarative** programming model, where users specify _what the desired state of the infrastructure should be_, and Terraform figures out how to achieve that state.

    -   **What, not How**: In a declarative approach, you define _what_ the final state of your infrastructure should look like, without specifying the step-by-step instructions on _how_ to achieve that state.
    -   **State-Driven**: Terraform compares the desired state (as written in the configuration files) with the actual state of the infrastructure (tracked in the state file) and determines the actions necessary to align the actual state with the desired state.
    -   **Idempotent**: Declarative code is idempotent, meaning that applying the same configuration multiple times will produce the same result without reapplying changes unnecessarily.
    -   **Automatic Dependency Management**: Terraform automatically determines the dependencies between resources and ensures they are created or updated in the correct order.

    ##### Imperative Programming in Terraform (and Infrastructure in General)

    In an **imperative** approach, the user provides explicit, step-by-step instructions on _how_ to achieve the desired outcome. It focuses more on the "how" and defines specific commands or sequences to accomplish a task.

    While Terraform itself is declarative, **provisioners** and external scripting can introduce imperative behaviors. For example, provisioning a server and then running a script to install software is an imperative action within an otherwise declarative Terraform workflow.

    -   **How, not What**: The imperative approach focuses on describing the _steps_ to reach the desired outcome, rather than just defining the end goal.
    -   **Procedural**: It involves a series of commands or steps that must be executed in a certain order.
    -   **Manual Dependency Handling**: The user needs to explicitly manage dependencies between steps, ensuring that actions occur in the correct sequence.

    </details>
    </details>
