<details><summary style="font-size:25px;color:Orange">AWS Profile Management</summary>

Maintaining multiple AWS accounts from a local machine involves managing credentials and configurations effectively. Here's a general approach to achieve this:

1. **AWS CLI Configuration**:

    - `Install AWS CLI`: Ensure that you have the AWS Command Line Interface (CLI) installed on your local machine.

        - `$ brew install awscli`

    - `Configure AWS CLI Profiles`:

        - Use the aws configure command to set up AWS CLI profiles for each AWS account.
        - Run the command and follow the prompts to provide Access Key ID, Secret Access Key, default region, and output format for each profile.
        - Specify a unique profile name for each account (e.g., personal, work, testing, etc.).

    - `Verify Profiles`: Use the `aws configure list` command to verify that the profiles have been configured correctly.

2. **~/.aws/config**:

    - `Purpose`: The `~/.aws/config` file is used to specify AWS CLI configurations, such as the default region, output format, and additional named profiles.
    - `Format`: It is formatted as an INI file with sections for each named profile and configuration options within each section.
    - `Sample Configuration:`

        ```ini
        # ~/.aws/config
        [default]
        region = us-west-2
        output = json

        [profile personal] # Add a profile by the name of 'personal'
        region = us-east-1
        output = json
        ```

3. **~/.aws/credentials**:

    - `Purpose`: The `~/.aws/credentials` file is used to store AWS access keys and secret access keys for named profiles.
    - `Format`: It is also formatted as an INI file with sections for each named profile and credential options within each section.
    - `Sample Configuration`:

        ```ini
        # ~/.aws/credentials
        [default]
        aws_access_key_id = YOUR_ACCESS_KEY_ID
        aws_secret_access_key = YOUR_SECRET_ACCESS_KEY

        [personal]
        aws_access_key_id = PERSONAL_ACCESS_KEY_ID
        aws_secret_access_key = PERSONAL_SECRET_ACCESS_KEY
        ```

4. **config vs credentials**:

    - The `config` file stores configuration settings like the default region and output format, while the `credentials` file stores access keys and secret access keys for each profile.
    - The `config` file contains configuration options, whereas the `credentials` file contains sensitive authentication credentials.
    - The `~/.aws/config` and `~/.aws/credentials` files are both used by the AWS Command Line Interface (CLI) to manage AWS configurations and credentials, but they serve different purposes:

5. **IAM Role Assumption (Optional)**:

    - `Cross-Account Access`:
        - If you need to access resources in one AWS account from another account, you can set up IAM roles and use role assumption.
        - Configure role assumption in the AWS CLI configuration or use temporary credentials obtained via the aws sts assume-role command.

#### AWS CLI

-   `$ aws configure list`
-   `$ aws configure set output json` -> Set the output format: `json`, `text`, or `table`
-   `$ aws configure get property_name [--profile profile_name]`
-   `$ aws configure get aws_access_key_id`
-   `$ aws configure get region --profile ht`
-   `$ aws configure get output --profile ht`
-   `$ aws configure set property_name value [--profile profile_name]`
-   `$ aws configure set aws_access_key_id YOUR_ACCESS_KEY`
-   `$ aws configure set default.region us-east-2` -> aws configure set <varname> <value> [--profile profile-name]
-   `$ aws iam list-users` -> If you've just one profile set locally
-   `$ aws iam list-users --profile <profile-name>` -> If you've multiple profiles set locally
-   `$ `
-   `$ aws s3 ls --profile personal` -> specify the desired profile using the `--profile` option.
-   `$ export AWS_PROFILE=personal` -> Change the default profile by setting the `AWS_PROFILE` environment variable

-   `$ aws configure set <option-name> "" --profile <profile-name>` -> Remove a specific configuration key

1. **Configure MFA (Multi-Factor Authentication)**:  
   Use the `--serial-number` flag to configure MFA for a session:

    ```bash
    aws sts get-session-token --serial-number arn:aws:iam::<account-id>:mfa/<user-name> --token-code <mfa-code>
    ```

2. **Rotate Access Keys**:  
   If your keys are compromised or need rotation, delete the old ones and add new ones:
    ```bash
    aws iam delete-access-key --access-key-id <old-key-id>
    aws iam create-access-key
    ```

</details>

---

<details><summary style="font-size:15px;color:Magenta">Confusing Concepts</summary>

-   [The Most Important AWS Core Services That You NEED To Know About!](https://www.youtube.com/watch?v=B08iQQhXG1Y)

##### Services vs Resources

-   AWS Services refer to the various offerings and capabilities provided by Amazon Web Services, such as Amazon S3 (Simple Storage Service), Amazon EC2 (Elastic Compute Cloud), AWS Lambda, Amazon RDS (Relational Database Service), Amazon SQS (Simple Queue Service), and many others. Each of these services provides specific functionality, and customers can choose which services they want to use and in what combination, depending on their needs.
-   AWS Resources, on the other hand, refer to specific instances of AWS services that have been created by customers or by other AWS services on their behalf. For example, if a customer creates an EC2 instance, that instance is an AWS resource. Similarly, if a customer creates an S3 bucket, that bucket is an AWS resource.
-   In summary, AWS Services are the various capabilities provided by AWS, while AWS Resources are the specific instances of those services that customers create and manage. Understanding the distinction between these terms is important for effectively using and managing AWS infrastructure.

##### Permission vs Policy

-   A permission is a statement that grants or denies access to a specific AWS resource or operation. Permissions are attached to an identity, such as a user, group, or role, and specify what actions that identity can perform on the resource. For example, a permission might allow a user to read objects from a specific S3 bucket, but not delete them.
-   A policy is a set of permissions that can be attached to an identity to define its overall access to AWS resources. A policy can include one or more permissions and can be attached to multiple identities. For example, a policy might allow all members of a certain group to access a specific set of EC2 instances.

</details>

---

<details><summary style="font-size:25px;color:Orange">EC2</summary>

-   [DigitalCloud: EC2](https://www.youtube.com/watch?v=8bIW7qlldLg&t=108s)

Amazon Elastic Compute Cloud (Amazon EC2) is a web service provided by Amazon Web Services (AWS) that allows users to rent virtual servers on which they can run their applications. Below are some key terms and concepts associated with AWS EC2:

Amazon EC2 (Elastic Compute Cloud) is a central service in AWS that provides scalable computing capacity in the cloud. It allows users to launch virtual servers (instances) with flexible configurations. Below is an explanation of all the components and concepts associated with AWS EC2:

-   **EC2 Instance**: An instance is a virtual server in the cloud. It represents the computing resources (CPU, memory, storage, etc.) that you can rent from AWS. Instances are the fundamental building blocks of EC2.

    -   **Definition**: A virtual server that runs on the AWS cloud infrastructure. You can choose the hardware specifications, OS, and applications.
    -   **Purpose**: EC2 instances provide compute resources for running applications, processing data, or hosting services.
    -   **Key Attributes**:
        -   **vCPU**: Virtual CPU capacity.
        -   **RAM**: Memory for applications.
        -   **Network**: Networking performance (low, medium, or high bandwidth).

-   **Amazon Machine Image (AMI)**: An AMI is a pre-configured template used to create instances. It contains the necessary information to launch an instance, including the operating system, application server, and applications.

    -   **Definition**: A pre-configured template containing the operating system, application server, and applications for launching EC2 instances.
    -   **Purpose**: AMIs allow you to create consistent EC2 instances based on a saved image.
    -   **Types**:
        -   **AWS-provided**: Amazon offers base AMIs (e.g., Amazon Linux, Ubuntu).
        -   **Custom**: Users can create custom AMIs with specific software configurations.
        -   **Marketplace AMIs**: Third-party vendors offer AMIs with specific software solutions.

-   **Instance Types**

    -   **Definition**: Pre-defined combinations of CPU, memory, storage, and network performance. Different instance types suit different workloads.
    -   **Purpose**: Helps users choose the right compute power based on their application needs.
    -   **Categories**:
        -   **General Purpose (e.g., t2.micro, m5.large)**: Balanced compute, memory, and networking resources.
        -   **Compute Optimized (e.g., c5.large)**: Designed for compute-intensive tasks.
        -   **Memory Optimized (e.g., r5.xlarge)**: Ideal for memory-intensive applications.
        -   **Storage Optimized (e.g., i3.xlarge)**: High-performance for applications needing fast local storage.
        -   **Accelerated Computing (e.g., p3.xlarge)**: Instances with GPUs for machine learning and graphic-intensive tasks.

-   **Elastic Block Store (EBS)**: EBS provides block-level storage volumes that you can attach to EC2 instances. It is used for data that requires persistent storage. EBS volumes can be used as the root file system or attached to an instance as additional storage.

    -   **Definition**: A block-level storage service used to attach persistent storage to EC2 instances.
    -   **Purpose**: Provides scalable, durable storage volumes that can be attached to instances. These volumes persist independently of the instance lifecycle.
    -   **Types**:
        -   **General Purpose SSD (gp2/gp3)**: Balanced performance and cost.
        -   **Provisioned IOPS SSD (io1/io2)**: High performance for I/O-intensive workloads.
        -   **Magnetic (st1/sc1)**: Cost-effective for sequential access workloads like logging or backup.

-   **Elastic IP Address (EIP)**

    -   **Definition**: A static, public IPv4 address that you can allocate and associate with your EC2 instance.
    -   **Purpose**: Ensures your instance retains a consistent public IP address even if the instance is stopped and restarted.

-   **Security Groups**: Security groups act as virtual firewalls for instances. They control inbound and outbound traffic based on rules that you define. Each instance can be associated with one or more security groups.

    -   **Definition**: Virtual firewalls that control inbound and outbound traffic to EC2 instances.
    -   **Purpose**: Security groups allow or block traffic based on rules defined by IP address, protocol, and port.
    -   **Stateful**: Security groups remember allowed traffic for responses without needing separate rules.

-   **Key Pairs**: A key pair consists of a public key and a private key. It is used for securely connecting to an EC2 instance. The public key is placed on the instance, and the private key is kept secure.

    -   **Definition**: A public-private key pair used for SSH access to EC2 instances.
    -   **Purpose**: The public key is stored on the instance, and the private key is used by the user to securely connect to the instance.

-   **Elastic Load Balancing (ELB)**: ELB automatically distributes incoming application traffic across multiple EC2 instances. It enhances the availability and fault tolerance of your application.

    -   **Definition**: A service that automatically distributes incoming traffic across multiple EC2 instances.
    -   **Purpose**: Ensures high availability and reliability by distributing incoming requests to healthy instances.
    -   **Types**:
        -   **Application Load Balancer**: Layer 7 load balancing (for HTTP/HTTPS traffic).
        -   **Network Load Balancer**: Layer 4 load balancing (for TCP/UDP traffic).
        -   **Gateway Load Balancer**: Enables third-party virtual appliances.

-   **Placement Groups**

    -   **Definition**: Logical grouping of instances to influence how EC2 instances are placed on the underlying hardware.
    -   **Purpose**: Enhances performance for specific workloads.
    -   **Types**:
        -   **Cluster Placement Group**: Instances are grouped closely in a single Availability Zone for low-latency, high-throughput networking.
        -   **Spread Placement Group**: Instances are distributed across underlying hardware to reduce simultaneous failures.
        -   **Partition Placement Group**: Divides instances into partitions where they are placed on distinct sets of racks to minimize correlated failures.

-   **Launch Template**

    -   **Definition**: A configuration template that defines how to launch EC2 instances.
    -   **Purpose**: Standardizes the instance creation process by including configurations like instance types, AMIs, key pairs, and security groups.

-   **Elastic Network Interface (ENI)**

    -   **Definition**: A network interface that can be attached to an EC2 instance to manage multiple IP addresses.
    -   **Purpose**: Allows instances to have multiple private and public IP addresses, multiple security groups, and can be detached/reattached across instances.

-   **Network Address Translation (NAT) Gateway**

    -   **Definition**: A managed gateway that allows instances in private subnets to connect to the internet while preventing incoming traffic from reaching them.
    -   **Purpose**: Enables private EC2 instances to download updates or access public internet resources securely.

-   **Elastic GPUs**

    -   **Definition**: A feature that allows you to attach GPU resources to existing EC2 instances.
    -   **Purpose**: Adds GPU capability to instances for tasks like graphics rendering, machine learning, and other GPU-intensive operations.

-   **IPv4 and IPv6 Addresses**

    -   **Definition**: Public and private IP addresses assigned to EC2 instances for communication.
    -   **Purpose**: IP addresses allow EC2 instances to communicate with other instances, on-premises networks, or the internet.

-   **Region**: AWS divides the world into geographic areas called regions. Each region contains multiple Availability Zones. Examples of regions include us-east-1 (North Virginia), eu-west-1 (Ireland), and ap-southeast-2 (Sydney).
-   **Availability Zone (AZ)**: An Availability Zone is a data center or a collection of data centers within a region. Each Availability Zone is isolated but connected to the others. Deploying instances across multiple Availability Zones increases fault tolerance.
-   **Auto Scaling**: Auto Scaling allows you to automatically adjust the number of EC2 instances in a group based on demand. It helps maintain application availability and ensures that the desired number of instances are running.
-   **Placement Groups**: Placement groups are logical groupings of instances within a single Availability Zone. They are used to influence the placement of instances to achieve low-latency communication.
-   **Spot Instances**: Spot Instances are spare EC2 capacity that is available at a lower price. You can bid for this capacity, and if your bid is higher than the current spot price, your instances will run. However, they can be terminated if the spot price exceeds your bid.
-   **On-Demand Instances**: On-Demand Instances allow you to pay for compute capacity by the hour or second with no upfront costs. This is a flexible and scalable pricing model suitable for variable workloads.
-   **Reserved Instances**: Reserved Instances offer significant savings over On-Demand pricing in exchange for a commitment to a one- or three-year term. They provide a capacity reservation, ensuring availability.

</details>

---

<details><summary style="font-size:25px;color:Orange">VPC (Virtual Private Cloud)</summary>

-   [Linux Academy: AWS Essentials: Project Omega!](https://www.youtube.com/watch?v=CGFrYNDpzUM&list=PLv2a_5pNAko0Mijc6mnv04xeOut443Wnk)
-   [DogitalCloud: AWS VPC Beginner to Pro - Virtual Private Cloud Tutorial](https://www.youtube.com/watch?v=g2JOHLHh4rI&t=2769s)
-   [VPC Assignments](https://www.youtube.com/playlist?list=PLIUhw5xEbE-UzGtDn5yBfXBTkJR6QgWIi)
-   [3.Terraform : Provision VPC using Terraform | Terraform Manifest file to Create VPC and EC2 Instance](https://www.youtube.com/watch?v=wx7L6snkrTU)

Amazon VPC (Virtual Private Cloud) is a service that enables you to launch Amazon Web Services (AWS) resources into a virtual network that you define. Here are some common terms and concepts related to AWS VPC:

-   **VPC**: AWS VPC (Amazon Virtual Private Cloud) is a service provided by Amazon Web Services (AWS) that allows you to create a virtual network in the AWS cloud. It enables you to define a logically isolated section of the AWS cloud where you can launch AWS resources such as EC2 instances, RDS databases, and more. Here are some key aspects and features of AWS VPC:

    -   `Isolation`: A VPC provides network isolation, allowing you to create a virtual network environment that is logically isolated from other networks in the AWS cloud. This isolation helps enhance security and control over your resources.
    -   `Customization`: You have full control over the IP address range, subnets, route tables, and network gateways within your VPC. This allows you to design and configure the network according to your specific requirements.
    -   `Subnets`: Within a VPC, you can create multiple subnets, each associated with a specific availability zone (AZ) within an AWS region. Subnets help organize and segment your resources and allow you to control network traffic between them.
    -   `Internet Connectivity`: By default, instances launched within a VPC do not have direct access to the internet. To enable internet connectivity, you can configure an internet gateway (IGW) and route internet-bound traffic through it.
    -   `Security`: VPC provides several features to enhance network security, including security groups and network access control lists (ACLs). Security groups act as virtual firewalls, controlling inbound and outbound traffic at the instance level, while network ACLs provide subnet-level security by controlling traffic flow.
    -   `Peering and VPN Connections`: VPC allows you to establish peering connections between VPCs within the same AWS region, enabling inter-VPC communication. Additionally, you can establish VPN (Virtual Private Network) connections between your on-premises network and your VPC, extending your network securely into the AWS cloud.
    -   `VPC Endpoints`: VPC endpoints enable private connectivity to AWS services without requiring internet gateway or NAT gateway. This enhances security and can reduce data transfer costs.
    -   `VPC Flow Logs`: VPC Flow Logs capture information about the IP traffic flowing in and out of network interfaces in your VPC. This data can be used for security analysis, troubleshooting, and compliance auditing.

-   **Subnet**: In AWS, a subnet (short for sub-network) is a segmented portion of an Amazon VPC (Virtual Private Cloud). Subnets allow you to divide a VPC's IP address range into smaller segments, which can be associated with specific availability zones (AZs) within an AWS region. Here are some key points to understand about AWS subnets:

    -   `Public and Private Subnets`: Subnets can be categorized as public or private based on their routing configuration:
        -   `Public Subnets`: Public subnets have routes to an internet gateway, allowing instances within the subnet to communicate directly with the internet. They are typically used for resources that require public accessibility, such as web servers.
        -   `Private Subnets`: Private subnets do not have direct internet access. Instances in private subnets can communicate with the internet or other AWS services through a NAT gateway, VPC endpoint, or VPN connection. Private subnets are commonly used for backend services or databases that should not be directly exposed to the internet.
    -   `Segmentation`: Subnets enable you to logically segment your VPC's IP address space. Each subnet is associated with a specific CIDR (Classless Inter-Domain Routing) block, which defines the range of IP addresses available for use within that subnet.
    -   `Routing`: Each subnet has its own route table, which defines how traffic is routed within the subnet and to other subnets or external networks. You can customize route tables to control traffic flow, including specifying routes to internet gateways, virtual private gateways, NAT gateways, and VPC peering connections.
    -   `Availability Zones`: Subnets are tied to specific availability zones within an AWS region. Each subnet exists in exactly one availability zone, and you can create subnets in multiple AZs within the same region to achieve high availability and fault tolerance for your applications.
    -   `Traffic Isolation`: Instances launched in different subnets within the same VPC are isolated from each other at the network level. By controlling the routing and network access policies within subnets, you can control the flow of traffic between resources.
    -   `Associated Resources`: Subnets can be associated with various AWS resources, including EC2 instances, RDS databases, Lambda functions, and more. When launching resources, you can specify the subnet in which the resource should reside.

-   **CIDR (Classless Inter-Domain Routing)**: `CIDR` is a notation for representing a range/block of IP addresses with their associated `Network Prefix`. It allows for a more flexible allocation of IP addresses than the older class-based system (Class A, B, and C networks). `CIDR` notation includes both the IP address and the length of the network prefix, separated by a slash (`/`). For example, `10.0.0.0/16` indicates a network with a 16-bit prefix and represents a `CIDR` block with a range of IP addresses from `10.0.0.0` to `10.0.255.255`. The size of a `CIDR` block is $2^{32 − Prefix Length} = 2^{32 − 16} = 2^16$

    -   In AWS, when you create a VPC, you define its IP address range using `CIDR` notation. `CIDR` notation is a compact representation of an IP address range, expressed as a base address followed by a forward slash and a numerical value representing the prefix length. For example, `10.0.0.0/16` indicates a network with a 16-bit network-prefix and represents a `CIDR` block with a range of IP addresses from 10.0.0.0 to 10.0.255.255.

    -   `Network Prefix`: A network prefix refers to the part of an IP address that identifies the network or subnet itself. It is specified by a `CIDR` (Classless Inter-Domain Routing) notation, which consists of an IP address followed by a slash (`/`) and a number (the prefix length). The prefix length defines how many bits of the IP address are dedicated to identifying the network. For example, in the `CIDR` block `192.168.1.0/24`, the `/24` is the network prefix length, meaning the first 24 bits (or the first three octets) of the IP address represent the network itself, and the remaining bits are available for host addresses within that network. The first 24 bits (or the first three octets) are reffered as the `Network Prefix`.

-   **Route Table**: A Route Table in AWS VPC is a set of rules that controls how network traffic is directed within the VPC. It determines where traffic from your subnets is routed, such as to the internet, other VPCs, or within the same VPC. Each subnet in a VPC must be associated with a route table, and the table specifies the paths traffic can take, like sending internet-bound traffic through an internet gateway or directing traffic to other private resources.

    -   `Main Route Table`: The default route table that is automatically created when a VPC is set up. All subnets not explicitly associated with a custom route table use this table.

        -   Acts as the fallback route table for all subnets in the VPC unless overridden by custom route tables.

    -   `Route`: A Route Table contains a set of rules, known as routes, that determine the path of network traffic. Each route specifies a destination `CIDR` (Classless Inter-Domain Routing) block and a target, indicating where traffic destined for that `CIDR` block should be forwarded.

        -   `Default Route`: Every Route Table includes a default route, which typically directs traffic with an unspecified destination (`0.0.0.0/0`) to a target, such as an internet gateway (`IGW`) or a virtual private gateway (VGW). This default route allows instances within the VPC to communicate with resources outside the VPC, such as the internet or other VPCs.
        -   `Custom Routes`: In addition to the default route, you can add custom routes to a Route Table to define specific paths for traffic destined for particular CIDR blocks. For example, you can create custom routes to route traffic to a VPN connection, Direct Connect gateway, or VPC peering connection.
        -   `Example Route Table Entries`:

            | Destination      | Target           | Purpose                                                    |
            | ---------------- | ---------------- | ---------------------------------------------------------- |
            | `0.0.0.0/0`      | Internet Gateway | Route internet-bound traffic from public subnets.          |
            | `10.0.0.0/16`    | local            | Default route for intra-VPC communication.                 |
            | `10.0.1.0/24`    | VPC Endpoint     | Direct traffic to AWS services like S3 using VPC Endpoint. |
            | `0.0.0.0/0`      | NAT Gateway      | Route internet-bound traffic from private subnets.         |
            | `192.168.1.0/24` | VPC Peering      | Route traffic to a peered VPC.                             |

    -   `Associations`: Each subnet in a VPC is associated with one Route Table for inbound traffic and one Route Table for outbound traffic. This association determines how traffic is routed to and from instances within the subnet. By associating subnets with different Route Tables, you can control the flow of traffic and implement network segmentation.
    -   `Propagation`: Route Tables can be associated with virtual private gateways (`VGW`) for VPN connections or transit gateways for inter-VPC communication. In such cases, routes learned from these gateways are automatically propagated to the associated Route Table.
    -   `Prioritization`: Routes in a Route Table are evaluated in priority order, with more specific routes taking precedence over less specific routes. If multiple routes match a destination CIDR block, the most specific route (i.e., the route with the longest prefix length) is chosen.
    -   `Multi-Subnet Routing`: In a multi-subnet VPC architecture, different subnets can be associated with different Route Tables, allowing you to implement distinct routing policies based on subnet requirements. This enables you to enforce security policies, direct traffic to specific gateways, or implement advanced networking configurations.

-   **Internet Gateway**: An AWS Internet Gateway (IGW) is a horizontally scaled, redundant, and highly available VPC component that allows communication between instances within your VPC and the internet. It serves as a gateway to facilitate inbound and outbound internet traffic for resources within your VPC. Here are the key points to understand about AWS Internet Gateways:

    -   `Public Subnets`: Internet Gateways are typically associated with public subnets within your VPC. Public subnets have routes to the Internet Gateway in their route tables, enabling instances within those subnets to communicate directly with the internet.
    -   `Routing`: To enable internet access for instances within your VPC, you need to add a route to the internet gateway in the route table associated with the subnet. This route directs traffic destined for the internet to the Internet Gateway.
    -   `High Availability`: Internet Gateways are designed to be highly available and redundant. They are automatically replicated across multiple Availability Zones within the same AWS region to ensure resilience and fault tolerance.
    -   `Stateful`: Internet Gateways are stateful devices, meaning they keep track of the state of connections and allow return traffic for outbound connections initiated by instances within the VPC. This enables bidirectional communication between instances and external hosts on the internet.
    -   `Security`: Internet Gateways do not perform any security functions on their own. Security is primarily managed using AWS security groups and network access control lists (NACLs) associated with the instances and subnets within the VPC.
    -   `Billing`: While there is no charge for creating an Internet Gateway, you are billed for data transfer out of your VPC to the internet based on the volume of data transferred.

-   **NAT Gateway**: An AWS NAT Gateway (Network Address Translation Gateway) is a managed AWS service that enables instances within private subnets of a VPC (Virtual Private Cloud) to initiate outbound traffic to the internet while preventing inbound traffic from reaching those instances. Here are the key aspects of AWS NAT Gateway:

    -   `Outbound Internet Access`: NAT Gateway allows instances in private subnets to access the internet for software updates, patching, or downloading dependencies. It achieves this by performing network address translation (NAT), replacing the private IP addresses of the instances with its own public IP address when communicating with external hosts on the internet.
    -   `Private Subnets`: NAT Gateway is typically deployed in a public subnet within the VPC, allowing instances in private subnets to route their outbound traffic through it. Private subnets do not have direct internet connectivity and rely on NAT Gateway to access the internet.
    -   `Security`: Since NAT Gateway resides in a public subnet, it is exposed to the internet. However, it does not allow inbound traffic initiated from external sources to reach instances in private subnets. This enhances security by preventing direct access to instances from the internet.
    -   `High Availability`: NAT Gateway is a managed service provided by AWS and is designed for high availability and fault tolerance. It automatically scales to handle increased traffic volumes and is replicated across multiple Availability Zones within the same AWS region to ensure resilience.
    -   `Elastic IP Address`: Each NAT Gateway is associated with an Elastic IP (EIP) address, which provides a static, public IP address for outbound traffic. The EIP remains associated with the NAT Gateway even if it is replaced due to scaling or maintenance activities.
    -   `Usage Costs`: While there is no charge for creating a NAT Gateway, you are billed for the data processing and data transfer fees associated with outbound traffic routed through the NAT Gateway. Pricing is based on the volume of data processed and the AWS region where the NAT Gateway is deployed.
    -   `Automatic Failover`: AWS NAT Gateway automatically detects failures and redirects traffic to healthy instances. This ensures continuous availability and minimizes disruption to outbound internet connectivity.

-   **Network Access Control List (NACL)**: AWS Network Access Control Lists (NACLs) are stateless, optional security layers that control inbound and outbound traffic at the subnet level in an Amazon VPC (Virtual Private Cloud). They act as a firewall for controlling traffic entering and leaving one or more subnets within a VPC. Here's an explanation of the key aspects of AWS NACLs:

    -   `Subnet-Level Security`: NACLs are associated with individual subnets within a VPC. Each subnet can have its own NACL, which allows you to customize the network security policies for different parts of your VPC.
    -   `Stateless Inspection`: Unlike security groups, which are stateful, NACLs are stateless. This means that they evaluate each network packet independently, without considering the state of previous packets. As a result, you must explicitly configure rules for both inbound and outbound traffic in both directions.
    -   `Rule Evaluation`: NACLs are evaluated in a numbered order, starting with the lowest numbered rule and proceeding sequentially. When a network packet matches a rule, the corresponding action (allow or deny) is applied, and rule evaluation stops. If no rule matches, the default action (allow or deny) specified for the NACL is applied.
    -   `Rules`: NACL rules consist of a rule number, direction (inbound or outbound), protocol (TCP, UDP, ICMP, etc.), port range, source or destination IP address range, and action (allow or deny). You can create rules to permit or deny specific types of traffic based on criteria such as IP addresses, ports, and protocols.
    -   `Ordering`: The order of rules in an NACL is crucial because rule evaluation stops after the first matching rule is found. Therefore, it's essential to organize rules effectively to ensure that traffic is permitted or denied according to your security requirements.
    -   `Default Rules`: By default, every newly created NACL allows all inbound and outbound traffic. You can modify the default rules to restrict or permit traffic as needed. It's important to understand the default rules when configuring custom rules to avoid unintended consequences.
    -   `Association`: Each subnet in a VPC must be associated with one NACL for inbound traffic and one NACL for outbound traffic. If no custom NACLs are explicitly associated with a subnet, the default NACL is applied automatically.
    -   `Logging`: You can enable logging for a NACL to capture information about the traffic that matches the rules. This can be helpful for troubleshooting network connectivity issues, monitoring traffic patterns, and auditing security configurations.

-   **Network Interface**: An AWS network interface is a virtual network interface that can be attached to an EC2 instance in a VPC (Virtual Private Cloud). It acts as a network interface for an EC2 instance, providing connectivity to the network and allowing the instance to communicate with other resources within the VPC and the internet. Here are some key points about AWS network interfaces:

    -   `Virtual Network Interface`: An AWS network interface is a virtual entity that represents a network interface card (NIC) in a traditional server. It provides networking capabilities to an EC2 instance.
    -   `Flexible Attachment`: Network interfaces can be attached to or detached from EC2 instances as needed. This allows for flexibility in networking configurations, such as adding additional network interfaces for specific purposes like high availability or security.
    -   `Multiple Network Interfaces`: An EC2 instance can have multiple network interfaces attached to it. Each network interface operates independently, with its own private IP address, MAC address, and security groups.
    -   `Private IP Address`: Each network interface is assigned a private IP address from the subnet to which it is attached. This IP address allows the instance to communicate with other resources within the same VPC.
    -   `Public IP Address`: A network interface can also be associated with a public IP address or an Elastic IP address (EIP), allowing the instance to communicate with the internet.
    -   `Security Groups`: Network interfaces can be associated with one or more security groups, which act as virtual firewalls, controlling the traffic allowed to and from the instance.
    -   `Traffic Monitoring and Control`: AWS provides tools for monitoring and controlling traffic through network interfaces, such as VPC Flow Logs, which capture information about the IP traffic going to and from network interfaces.

-   **VPC Endpoint**: An `VPC Endpoint` allows you to privately connect your VPC to supported AWS services and VPC endpoint services powered by AWS PrivateLink, without using an internet gateway, NAT device, VPN connection, or AWS Direct Connect. These endpoints provide secure access to services by keeping traffic within the AWS network, avoiding exposure to the public internet.

    1. **Interface Endpoints**: Elastic Network Interfaces (ENI) with private IP addresses that act as entry points to services such as S3, DynamoDB, SNS, or your own AWS-hosted services.

        - `Purpose`: Provides private connectivity between your VPC and AWS services through the private IPs of the endpoints.
        - `Example Use Case`: Accessing Amazon S3 or Amazon DynamoDB from within your VPC without exposing traffic to the internet.
        - `Cost`: There's a cost for creating and using interface endpoints because they rely on AWS PrivateLink.

    2. **Gateway Endpoints**: A gateway that you specify in your route table to route traffic privately to Amazon S3 or DynamoDB.

        - `Purpose`: Provides a direct route from your VPC to these services without an intermediate NAT or VPN.
        - `Supported Services`: Currently, only Amazon S3 and DynamoDB are supported.
        - `Cost`: Free to use, but only available for a limited set of services.

-   `Egress-only Internet Gatway`:
-   `NAT Instanc`:
-   `Virtual Private Gateway`:
-   `Customer Gateway`:

-   `Elastic IP Address`: A static IP address that you can associate with your instance, even if it is stopped or started.
-   `Peering`: A connection between two VPCs that enables instances in one VPC to communicate with instances in the other VPC as if they were on the same network.
-   `VPN`: Virtual Private Network, a connection between your on-premises network and your VPC that enables secure communication.
-   `AWS Direct Connect`: A dedicated network connection between your on-premises data center and your VPC.
-   `VPC Flow Logs`: A feature that enables you to capture information about the IP traffic going to and from network interfaces in your VPC.

#### Availability Zone

An **Availability Zone (AZ)** in Amazon Web Services (AWS) is a distinct, isolated location within an AWS Region. Each AZ is a fully independent data center (or a cluster of data centers) with its own power, cooling, and networking infrastructure. However, Availability Zones within a region are connected to each other through low-latency, high-speed private networking.

-   **Key Features of Availability Zones**

    1. `Isolation`: Each AZ is physically separated from others in the same region, reducing the likelihood of a single point of failure affecting multiple AZs.

    2. `Low Latency`: The network connections between AZs within a region are designed to have very low latency, making it possible to build high-availability applications across multiple AZs.

    3. `Redundancy`: By using multiple AZs, you can design fault-tolerant applications. If one AZ goes down, your application can continue running from another AZ.

    4. `Proximity`: AZs are located close enough to ensure fast data transfer between them but far enough to avoid being impacted by the same physical disasters.

-   **Use Cases of Availability Zones**

    1. `High Availability`: Deploy resources (like EC2 instances, RDS databases, etc.) in multiple AZs to ensure high availability and disaster recovery.

    2. `Scalability`: Distribute workloads across multiple AZs to scale applications and balance traffic.

    3. `Disaster Recovery`: In case of an AZ failure, applications can fail over to another AZ in the same region.

    4. `Fault Tolerance`: Applications designed with redundancy across AZs can remain operational even if one AZ experiences issues.

-   **Availability Zones vs. Regions**

    | **Feature**    | **Region**                            | **Availability Zone (AZ)**               |
    | -------------- | ------------------------------------- | ---------------------------------------- |
    | **Definition** | Geographical location (e.g., US East) | Isolated data center(s) within a region  |
    | **Scope**      | Contains multiple AZs                 | Subset of a region                       |
    | **Redundancy** | Achieved across AZs within the region | Achieved across resources in the same AZ |
    | **Examples**   | `us-east-1`, `ap-south-1`             | `us-east-1a`, `ap-south-1b`              |

-   **Why Use Multiple AZs?**

    -   `Fault tolerance`: Your app can survive an AZ failure.
    -   `Improved latency`: Load balancers can distribute traffic across AZs.
    -   `Better disaster recovery`: Resources in one AZ can back up those in another.

</details>

---

<details><summary style="font-size:25px;color:Orange">IAM (Identity and Access Management)</summary>

-   [AWS IAM Core Concepts You NEED to Know](https://www.youtube.com/watch?v=_ZCTvmaPgao)
-   [AWS IAM Guides](https://www.youtube.com/playlist?list=PL9nWRykSBSFjJK9mFrIP_BPWaC0hAL9dZ)

**AWS IAM (Identity and Access Management)** is a service that enables you to manage access to AWS resources securely. IAM allows you to create and manage users, groups, roles, and permissions that define what actions are allowed or denied for AWS resources. Here are the key components of AWS IAM:

-   `Entities`: In AWS, an entity refers to any object or resource that can be managed by AWS services. Entities can include a wide variety of resources, including IAM users, EC2 instances, S3 buckets, RDS databases, Lambda functions, and more. AWS entities can be created, configured, and managed using AWS management tools such as the AWS Management Console, AWS CLI, and AWS SDKs. Depending on the type of entity, different AWS services may be used to manage it.
-   `Identity`: In the context of AWS (Amazon Web Services), "identity" refers to the concept of uniquely identifying and authenticating users or entities within the AWS ecosystem.
-   `Users`: IAM users are entities that you create to represent people, applications, or services that need access to AWS resources. Each user has a unique name and credentials.
-   `Groups`: IAM groups are collections of users. You can apply policies to groups to grant or deny access to AWS resources. Instead of assigning permissions directly to individual users, you can assign permissions to groups. This simplifies access management, as you can grant and revoke permissions for multiple users by managing group memberships.
-   `Roles`: IAM roles are similar to users but are intended for use by AWS services, applications, or other AWS accounts. Roles allow you to grant temporary access to resources across different accounts and services without having to create long-term credentials like access keys. IAM roles are a way to delegate permissions to entities that you trust. A role does not have any credentials, but instead, it is assumed by an entity that has credentials. This entity could be an AWS service, an EC2 instance, or an IAM user in another account. IAM roles can be used for a variety of purposes, such as granting permissions to AWS services or resources, allowing cross-account access, or providing permissions to an external identity provider (IdP).
-   `Permissions`: Permissions are the actions that users, groups, and roles are allowed or denied to perform on AWS resources. They are defined by IAM policies.

#### IAM Policies

**IAM policies** are documents that define permissions. They are attached to users, groups, and roles to determine what actions they can perform on AWS resources. A policy is a set of permissions that can be attached to an identity to define its overall access to AWS resources. A policy can include one or more permissions and can be attached to multiple identities. For example, a policy might allow all members of a certain group to access a specific set of EC2 instances.

The file `policy` is a JSON document in the current folder that grants read only access to the shared folder in an Amazon S3 bucket named my-bucket:

```json
{
    "Version": "2012-10-17",
    "Id": "default",
    "Statement": [
        {
            "Sid": "lambda-a75c4b44-4416-4229-91af-350e53bb044c",
            "Effect": "Allow",
            "Principal": {
                "Service": "events.amazonaws.com"
            },
            "Action": "lambda:InvokeFunction",
            "Resource": "arn:aws:lambda:us-east-1:554116157557:function:lambda_canary",
            "Condition": {
                "ArnLike": {
                    "AWS:SourceArn": "arn:aws:events:us-east-1:554116157557:rule/canary"
                }
            }
        }
    ]
}
```

-   **Common Attributes of AWS Policy Documents**:

    -   `Version`: The "Version" field specifies the version of the AWS policy language being used. It is required and indicates the syntax and structure of the policy. The version is typically specified as a date, such as "2012-10-17" or "2016-10-17."
    -   `Id`: The optional "Id" field is used to give a unique identifier to the policy. It is often used for managing and organizing policies in the AWS Management Console.
    -   `Statement`: The "Statement" field is the most important part of an AWS policy document. It contains an array of individual statements, each of which defines a permission or access control rule. A policy can have multiple statements.
    -   `Sid`: The optional "Sid" (Statement ID) field is used to provide a unique identifier for each statement within a policy. It is helpful for referencing or managing specific statements within the policy.
    -   `Effect`: The "Effect" field specifies whether the statement grants ("Allow") or denies ("Deny") permissions. It is a required field in each statement.
    -   `Principal`: The "Principal" field identifies the AWS identity (user, group, role, or AWS service) to which the permissions are granted or denied. It can also specify the **\*** wildcard to apply the permission to all identities.
    -   `Action`: The "Action" field defines the AWS service actions that are allowed or denied by the statement. It can specify a single action or a list of actions. AWS actions are typically named using a combination of the service name and the action name (e.g., "s3:GetObject," "ec2:CreateInstance").
    -   `Resource`: The "Resource" field specifies the AWS resources to which the actions are applied. It defines the scope of the permissions and can use Amazon Resource Names (ARNs) to identify specific resources.
    -   `Condition`: The optional "Condition" field allows you to define additional conditions that must be met for the permission to take effect. You can use various condition operators to check attributes like time, IP address, encryption status, and more.
    -   `NotAction, NotResource, NotPrincipal`: These fields are used to specify exceptions or negations in the policy. For example, "NotAction" can be used to allow all actions except the ones listed.
    -   `Resources and Actions ARN Format`: When specifying resources or actions in a policy, Amazon Resource Names (ARNs) are used. ARNs uniquely identify AWS resources and follow a specific format.
    -   `IAM Policies and Resource Policies`: AWS policy documents can be attached to IAM users, groups, and roles to manage access control. They can also be used as resource policies to manage permissions on individual AWS resources (e.g., S3 bucket policy).

-   **Managed Policy**: A managed policy in AWS is a standalone policy that you can attach to multiple IAM (Identity and Access Management) users, groups, or roles. Managed policies allow you to create and maintain a single policy that you can reuse across different entities, simplifying policy management and ensuring consistency in permissions across your AWS environment.

    -   `AWS Managed Policies`: Created and maintained by AWS, these policies are designed to provide permissions for common use cases, such as full access to a specific AWS service or read-only access to certain resources.
    -   `Customer Managed Policies`: Created and maintained by the user, these policies provide custom permissions tailored to specific organizational needs.

-   **Inline Policy**: An inline policy in AWS is a policy that's embedded directly within a single IAM (Identity and Access Management) user, group, or role. Unlike managed policies, which can be attached to multiple entities and reused, an inline policy is specific to the entity to which it is attached.

    ```json
    {
        "Version": "2012-10-17",
        "Statement": [
            {
                "Effect": "Allow",
                "Action": ["s3:GetObject", "s3:ListBucket"],
                "Resource": [
                    "arn:aws:s3:::example-bucket",
                    "arn:aws:s3:::example-bucket/*"
                ]
            }
        ]
    }
    ```

-   **Trust Policy** (Assume Role Policy): A trust policy in AWS is a JSON document that specifies which principals (users, accounts, services, etc.) are allowed to assume a specific role. It defines the conditions under which a role can be assumed and the actions that are allowed as a result.

    ```json
    {
        "Version": "2012-10-17",
        "Statement": [
            {
                "Effect": "Allow",
                "Principal": { "Service": "lambda.amazonaws.com" },
                "Action": "sts:AssumeRole"
            }
        ]
    }
    ```

-   **Principle-Based Policy**: A principal-based policy is a policy that is designed to allow or restrict actions based on the **principal** (i.e., the AWS account, user, role, or service) that is making the request. These policies specify what actions a specific principal can perform on a resource. Principals are at the center of AWS Identity and Access Management (IAM) policies, defining "who" has permission to do "what" on "which" resources. Following are key types of principal-based policies:

    1. `Identity-Based Policies`:

        - `Attached to Users, Groups, or Roles`: Identity-based policies are created to allow or deny access to AWS resources by attaching them directly to an IAM user, group, or role.
        - `Defines Permissions of the Principal`: These policies specify which actions and resources the principal (user, group, or role) can interact with.
        - `Flexible Scope`: You can make identity-based policies broad (like granting S3 access to a role) or specific (like restricting certain S3 actions).

    2. `Service-Control Policies (SCPs)`:

        - `Applied at the Organization Level`: In AWS Organizations, SCPs set boundaries for accounts within the organization or organizational units (OUs), limiting or allowing actions for all IAM users, groups, and roles within those accounts.
        - `Permissions Boundary`: SCPs act as a boundary layer, meaning even if a user has broader permissions in their IAM policy, SCPs can restrict certain actions, effectively setting the upper limit of permissions.

    3. `Resource-Based Policies`:
        - `Attached Directly to AWS Resources`: Some resources (like S3 buckets, Lambda functions, etc.) allow policies to be attached directly to them, defining who can access them. These policies also define the allowed actions on the resource.
        - `Granting Cross-Account Access`: Resource-based policies are often used to grant cross-account access, specifying who (in another account) can access a resource.

-   **Trust Relationship**: In Amazon Web Services (AWS), a "trust relationship" refers to the trust established between two entities, typically between an AWS Identity and Access Management (IAM) role and another entity, such as an AWS account or an external identity provider (IdP). The trust relationship defines who can assume the IAM role and under what conditions.

    -   `IAM Roles`: IAM roles are AWS identities that you can create and manage. They are not associated with a specific user or group, making them suitable for cross-account access, applications, and services. Trust relationships are commonly used with IAM roles.
    -   `Trusting Entity`: This is the entity that defines the IAM role and grants permissions to the role. The trusting entity specifies who is allowed to assume the role. This can be an AWS account or an external entity, like an external IdP.
    -   `Trusted Entity`: This is the entity or entities that are allowed to assume the IAM role. Trusted entities can assume the role to access AWS resources, services, or perform specific actions.
    -   `Conditions`: Trust relationships often include conditions that must be met for an entity to assume the role. Conditions can be based on various factors, such as time of day, source IP address, or other context-specific criteria.

    -   Common use cases for trust relationships in AWS include:

        -   `Service-to-Service Access`: Allowing AWS services, such as AWS Lambda, to assume roles with specific permissions to interact with other AWS services and resources securely.
        -   `Cross-Account Access`: Allowing entities from one AWS account to access resources in another AWS account. For example, you might use a trust relationship to allow a production account to access resources in a development or testing account.
        -   `Federated Access`: Enabling users from an external identity provider (e.g., Active Directory, SAML-based IdP) to assume IAM roles in AWS accounts. This is useful for single sign-on (SSO) scenarios.
        -   `Temporary Permissions`: Granting temporary permissions to entities. When an entity assumes a role, it receives temporary security credentials, and these credentials expire after a specified duration.

#### Role

An AWS IAM Role is a set of permissions that define what actions are allowed (or denied) in AWS. It is not associated with a specific user or group, but instead, it can be assumed by any trusted entity (like an AWS service, user, or application).

In simple terms, an IAM role allows you to grant temporary access to AWS resources to other services or users without sharing long-term credentials like access keys. The role specifies:

-   Who can assume the role (the trusted entity).
-   What permissions are granted to that entity while they use the role.

-   A role is an IAM identity that you can create in your account that has specific permissions. An IAM role has some similarities to an IAM user. Roles and users are both AWS identities with permissions policies that determine what the identity can and cannot do in AWS. However, instead of being uniquely associated with one person, a role can be assumed by anyone who needs it. A role does not have standard long-term credentials such as a password or access keys associated with it. Instead, when you assume a role, it provides you with temporary security credentials for your role session. You can use roles to delegate access to users, applications, or services that don't normally have access to your AWS resources.

-   **service role**: A service role is an IAM role that a service assumes to perform actions on your (users, groups, identities) behalf. Service roles provide permissions to AWS services so that they can interact with other AWS services and resources. The Key Characteristics of Service Roles are following.

    -   `Trust Relationship`: Service roles have a trust policy that specifies which services are allowed to assume the role. This policy grants the service permission to use the role.
    -   `Permissions Policies`: These roles also have permission policies that define what actions the service can perform and on which resources.
    -   `Temporary Security Credentials`: When an AWS service assumes a role, it uses temporary security credentials to make requests to other AWS services.

-   **assume-role-policy-document**: An assume-role-policy-document is a policy attached to an IAM role that defines who (which entities) can assume the role. This policy, also known as a trust policy, specifies the conditions under which the role can be assumed and the permissions granted to those entities.

    ```json
    {
        "Version": "2012-10-17",
        "Statement": [
            {
                "Effect": "Allow",
                "Principal": {
                    "Service": "ec2.amazonaws.com"
                },
                "Action": "sts:AssumeRole"
            }
        ]
    }
    ```

    -   `Version`: Specifies the version of the policy language.
    -   `Statement`: Contains one or more statements that define the principals and the actions allowed.
    -   `Effect`: Specifies whether the statement allows or denies access (usually "Allow").
    -   `Principal`: Specifies the AWS account, user, role, or service that can assume the role.
    -   `Action`: Specifies the action that is allowed (usually "sts ").
    -   `Condition`: (Optional) Specifies conditions under which the role can be assumed.

-   **Example**:

    -   Let's say we have an ec2 instance (which is a service as opposed to a user) where softwares are running and that softwares nees to access information that is in an s3 bucket. So we have one AWS service trying to communicate and talk with another AWS service. You may just think, well, let's just assign the s3 policy and that will grant access to the s3 bucket. But with AWS services you can't directly assign policies to other AWS services.
    -   First you need to attach a role to a service and then to the role you could attach policies. What the role does in essence is give permissions to another AWS service to almost act as a user. So we can assign a role to an EC2 instance that has the s3 full access policy attached to it, thus granting the ec2 instance access to s3. So you can almost think of roles as a group but for other AWS services as opposed to AWS users.

    -   Create Role:

        ```bash
        aws iam create-role
        --role-name Test-Role
        --assume-role-policy-document file://Test-Role-Trust-Policy.json
        ```

#### Security Group:

In Amazon Web Services (AWS), a security group is a virtual firewall that controls the inbound and outbound traffic for one or more instances. A security group acts as a set of firewall rules for your instances, controlling the traffic that is allowed to reach them. When you create an instance in AWS, you can assign it to one or more security groups. The following are some key terms and concepts related to AWS Security Groups:

-   `Inbound rules`: Inbound rules are used to control incoming traffic to an EC2 instance. Each rule specifies the source IP address, protocol (TCP/UDP/ICMP), port range, and action (allow/deny) for incoming traffic.
-   `Outbound rules`: Outbound rules are used to control outgoing traffic from an EC2 instance. Each rule specifies the destination IP address, protocol (TCP/UDP/ICMP), port range, and action (allow/deny) for outgoing traffic.
-   `IP address`: An IP address is a unique identifier assigned to devices on a network. In the context of AWS Security Groups, IP addresses can be used to specify the source or destination of traffic in inbound and outbound rules.
-   `CIDR block`: A Classless Inter-Domain Routing (`CIDR`) block is a range of IP addresses. It is used to specify a range of IP addresses in an inbound or outbound rule.
-   `Security Group ID`: A Security Group ID is a unique identifier assigned to an AWS Security Group. It is used to reference the Security Group in other AWS resources, such as EC2 instances.
-   `Stateful`: AWS Security Groups are stateful, which means that any traffic that is allowed in is automatically allowed out, and any traffic that is denied in is automatically denied out.
-   `Default Security Group`: Every VPC comes with a default security group. This security group is applied to all instances that are launched in the VPC if no other security group is specified.
-   `Port`: A port is a communication endpoint in an operating system. In the context of AWS Security Groups, it is used to specify the network port number for incoming or outgoing traffic.
-   `Protocol`: Protocol is a set of rules that govern how data is transmitted over a network. In the context of AWS Security Groups, it is used to specify the transport protocol (TCP/UDP/ICMP) for incoming or outgoing traffic.
-   `Network ACLs`: Network Access Control Lists (ACLs) are another layer of security at a VPC subnet level that can be used to control inbound and outbound traffic to the subnet. Unlike Security Groups, Network ACLs are stateless and can be used to filter traffic based on source/destination IP addresses, protocol, and port number.

-   **Security Groups**:

    -   `Ingress`: Security groups define inbound rules to control incoming traffic to your instances.
    -   `Egress`: Security groups also define outbound rules to control outgoing traffic from your instances.

-   **Network Access Control Lists (NACLs)**:

    -   `Ingress and Egress`: NACLs operate at the subnet level and provide additional control over inbound and outbound traffic. They are stateless, meaning rules for ingress and egress must be defined separately.

-   **Application Load Balancers (ALB) and Network Load Balancers (NLB)**:

    -   `Ingress`: Load balancers handle incoming traffic and distribute it across multiple instances. ALBs are used for routing HTTP/HTTPS traffic, while NLBs handle TCP/UDP traffic.
    -   `Egress`: Load balancers themselves don't generate egress traffic, but instances behind load balancers might generate egress traffic.

-   **Amazon VPC (Virtual Private Cloud)**:

    -   `Ingress and Egress`: VPCs allow you to define routing tables, which control the flow of traffic within and outside the VPC. Ingress and egress routes can be specified to direct traffic to specific destinations.

#### STS (Security Token Service)

AWS Security Token Service (STS) is a web service that enables you to request temporary, limited-privilege credentials for AWS Identity and Access Management (IAM) users or for users that you authenticate (federated users). These temporary security credentials work almost identically to long-term access key credentials, with the following differences:

-   **Temporary**: Temporary security credentials are short-lived. You configure expiration from a few minutes to several hours. After the credentials expire, AWS no longer recognizes them or allows any kind of access from API requests made with them.

-   **Dynamic**: These credentials are dynamically generated and can be used to provide access to AWS resources for a limited amount of time, making them a secure way to grant access to resources.

-   **Key Use Cases for STS**:

    1. `Identity Federation`: Allows users to access AWS resources using credentials from an external identity provider (IdP), such as Microsoft Active Directory, Facebook, or any other supported IdP.
    2. `Cross-Account Access`: Enables users to access resources in a different AWS account without having to create additional user identities.
    3. `IAM Roles for EC2 Instances`: Grants EC2 instances temporary security credentials to access AWS resources.
    4. `Temporary Elevated Access`: Allows you to provide users with temporary elevated access to resources without having to modify their long-term credentials.

-   **Main STS API Operations**

    -   `AssumeRole`: Requests temporary security credentials and associates them with a specified IAM role.
    -   `AssumeRoleWithSAML`: Returns temporary security credentials for users who have been authenticated via a SAML authentication response.
    -   `AssumeRoleWithWebIdentity`: Returns temporary security credentials for users authenticated via a web identity provider, such as Login with Amazon, Facebook, Google, or any OpenID Connect-compatible provider.
    -   `GetFederationToken`: Returns temporary security credentials for a federated user.
    -   `GetSessionToken`: Returns temporary security credentials for an AWS account or IAM user.

#### Instance Profile

An instance profile is an AWS Identity and Access Management (IAM) entity that allows EC2 instances to obtain temporary AWS credentials and interact with other AWS services. It acts as a bridge between an IAM role and an EC2 instance, facilitating secure access to AWS resources.

An instance profile is a container for an IAM role that you can use to pass role information to an EC2 instance when it is launched.
An instance profile is associated with only one IAM role, and it allows EC2 instances to assume the role and obtain temporary credentials.

-   **Create an Instance Profile**:

    -   An instance profile is created in IAM and is associated with the IAM role.
    -   You can create an instance profile using the AWS Management Console, AWS CLI, or AWS SDKs.

-   **Associate the Instance Profile with an EC2 Instance**:

    -   When launching an EC2 instance, specify the instance profile.
    -   The instance profile enables the EC2 instance to assume the IAM role and obtain temporary credentials from the AWS Security Token Service (STS).

-   **Access AWS Services**:

    -   Once the EC2 instance has assumed the role through the instance profile, it can use the temporary credentials to access AWS services based on the permissions defined in the role's policies.

#### IAM Users

An **IAM user** is an identity with specific permissions within an AWS account. IAM users are used to represent individuals or services that need to interact with AWS resources.

-   **Attributes**:
    -   **Login credentials**: Users can have a username and password for the AWS Management Console and access keys for API access.
    -   **Permissions**: Users can be assigned policies that define what actions they are allowed to perform.
    -   **Best practice**: For individuals, create IAM users instead of sharing the root account credentials.
-   **Federated Users**: Federated users are users that are authenticated by an external identity provider (IdP). AWS supports various IdPs, such as Active Directory, Google, or Facebook to grant temporary access to AWS resources. This allows you to integrate existing authentication systems with AWS, reducing the need to create separate IAM users for each individual. Federated users can be granted access to AWS resources using IAM roles.

#### IAM Groups

An **IAM group** is a collection of IAM users. You can attach policies to groups to apply common permissions to multiple users at once. Users in a group inherit the permissions assigned to the group.

-   **Attributes**:
    -   Simplifies the management of permissions.
    -   Commonly used to assign permissions based on job functions (e.g., Admins, Developers, and Read-Only Users).

#### IAM Access Keys

**Access keys** are credentials that IAM users or roles use to make programmatic requests to AWS APIs. These consist of:
Access keys consist of an access key ID and a secret access key. They are used to authenticate an AWS API request made by an IAM user, an AWS service, or an application.

-   **Access Key ID**: A unique identifier.
-   **Secret Access Key**: A secret key that is used with the access key ID to sign requests securely.

-   **Attributes**:
    -   **Best practice**: Rotate keys regularly, and avoid embedding them directly into code (use tools like AWS Secrets Manager).
    -   **Usage**: Typically used for CLI or API access to AWS services.

#### IAM Identity Providers

**IAM identity providers** allow users from an external identity system (such as corporate directories or web identity providers) to access AWS resources without creating an IAM user for each one.

-   **Types of Identity Providers**:
    -   **SAML 2.0**: Integrates with corporate directories like Microsoft Active Directory for single sign-on (SSO).
    -   **Web Identity Federation**: Supports providers like Google, Facebook, and Amazon for web identity-based authentication.
    -   **OIDC (OpenID Connect)**: Allows external identity providers that support the OIDC standard to be used for access to AWS.

#### IAM Permissions Boundaries

A **permissions boundary** is a feature that allows you to define the maximum permissions an IAM role or user can have. Even if the user or role has broader permissions in their assigned policies, they cannot exceed the permissions set in the boundary.

-   **Attributes**:
    -   Useful for limiting permissions that roles or users can grant to themselves or others.
    -   Helps prevent privilege escalation attacks.

#### Multi-Factor Authentication (MFA)

MFA adds an extra layer of security by requiring users to enter a second form of authentication (e.g., one-time passcode) in addition to their credentials.

Multi-Factor Authentication (MFA) adds an extra layer of security to your AWS account. It requires users to provide a second form of authentication, such as a one-time password generated by a hardware or software token.

-   **Attributes**:
    -   **Virtual MFA devices**: Can be implemented using applications like Google Authenticator.
    -   **Hardware MFA devices**: AWS supports physical MFA devices like hardware tokens.

#### Best Practices for AWS IAM

-   Use **IAM roles** instead of IAM users for accessing AWS resources when possible.
-   Implement **Multi-Factor Authentication (MFA)** for all privileged accounts.
-   Follow the **principle of least privilege**: Assign only the permissions necessary for the task.
-   Regularly rotate **access keys** and monitor usage with IAM credential reports.
-   Use **permissions boundaries** to limit the scope of permissions assigned to roles and users.

</details>

---

<details><summary style="font-size:25px;color:Orange">Lambda Function</summary>

AWS Lambda is a serverless computing service provided by Amazon Web Services (AWS) that allows users to run their code without having to manage servers or infrastructure. Here are some key terms and concepts related to AWS Lambda:
AWS Lambda is a serverless computing service that automatically runs code in response to events, managing the underlying compute infrastructure. It allows you to execute your code without provisioning or managing servers, enabling you to focus solely on your application logic. Here are the main concepts and components of AWS Lambda:
A **Lambda function** is the core concept of AWS Lambda. It is a piece of code that you write and deploy, which AWS Lambda automatically executes in response to events or triggers.

-   **Components**:

    -   **Code**: Written in supported languages (Python, Node.js, Java, Go, Ruby, C#, etc.).
    -   **Handler**: The entry point of the Lambda function, where the execution begins.
    -   **Deployment Package**: Includes your code and any dependencies in a zip file or a container image (if using container-based Lambda).

#### Function Configuration

Each Lambda function has a set of configurations that define how it behaves, including memory, timeout, and concurrency settings.

1. **Basic Settings**

    - **Function Name**:

        - The name assigned to the function, which must be unique within an AWS Region and account.

    - **Runtime**:

        - Specifies the programming language and version that the Lambda function will use (e.g., Python 3.9, Node.js 18.x, Java 11).
        - AWS Lambda manages and updates runtimes, but deprecated versions eventually lose support, so updating periodically is crucial.

    - **Execution Role & Policies**:

        - Lambda functions require an **Identity and Access Management (IAM) role** with permissions to interact with AWS resources.
        - The role grants the function access to resources such as S3 buckets, DynamoDB tables, or the CloudWatch Logs service where function logs are stored.
        - Following the principle of least privilege, the role should have the minimum permissions needed.
        - `Resource-Based Policies`: Lambda functions can have resource-based policies to control which AWS accounts or services can invoke the function. This is especially useful for cross-account or cross-service access, like allowing an S3 bucket from another account to trigger a Lambda function.

    - **Handler**:
        - Defines the entry point of the function. The handler is a function within your code that AWS Lambda calls to start execution.
        - The format is typically `filename.method_name` (e.g., `lambda_function.lambda_handler`), where `lambda_function` is the filename and `lambda_handler` is the method name.

2. **Memory and Timeout**

    - **Memory Allocation**:

        - The memory (in MB) allocated to a Lambda function can range from 128 MB to 10 GB, in increments of 1 MB.
        - More memory usually results in more CPU and network bandwidth allocation, which can speed up execution but also increase costs.
        - Lambda pricing is based on memory and execution time, so optimizing memory for performance and cost balance is essential.

    - **Timeout**:

        - The maximum time that a Lambda function can run per invocation, with a range from 1 second to 15 minutes (900 seconds).
        - If the function exceeds the timeout, it is terminated, so setting an appropriate timeout based on expected execution duration is critical to prevent early termination.
        - Specifies the maximum duration for function execution. Lambda terminates the function if it exceeds this time, ensuring resource cleanup and preventing long-running executions.

    - **Retry Policies**:
        - You can configure retry policies for asynchronous invocations and event source mappings. These are useful for automatically handling transient failures, allowing your function more opportunities to complete.

3. **Concurrency and Scaling**

    - **Reserved Concurrency**:

        - Allows reserving a portion of account-level concurrency for the function. It ensures that the function has dedicated capacity but limits the maximum concurrent executions it can have.
        - Useful for protecting other resources from being overwhelmed by excessive function executions.

    - **Provisioned Concurrency**:
        - Keeps a pre-warmed pool of instances ready to handle requests, reducing cold starts and improving response times for latency-sensitive applications.
        - This is ideal for API backends, interactive applications, or high-traffic functions where fast execution is critical.

4. **Environment Variables**

    - Key-value pairs used to store configuration data or secrets needed by the function, such as API keys, database credentials, or resource configurations.
    - **Environment Variable Encryption**: By default, Lambda encrypts environment variables using AWS Key Management Service (KMS). You can also specify a custom KMS key for added security.

5. **Networking**: AWS Lambda can be configured to run inside a **Virtual Private Cloud (VPC)**, allowing your function to access private resources like RDS or EC2 instances.

    - When you configure a Lambda function to connect to a VPC, you specify subnets and security groups to control network access.
    - Note that adding VPC connectivity may impact Lambda’s cold start time because it requires additional network setup.
    - `VPC Subnets`: Functions running in VPC can interact with private subnets and on-premises resources through a VPN or Direct Connect.
    - `VPC Endpoints`: Can be used to access AWS services privately without internet access.

6. **Dead Letter Queue (DLQ)**

    - Specifies an Amazon SQS queue or an Amazon SNS topic as a **Dead Letter Queue** for asynchronous invocation errors.
    - When a Lambda function cannot process an event after a certain number of retries, the event is sent to the DLQ for later analysis or reprocessing.
    - Useful for handling errors gracefully, ensuring events aren’t lost.

7. **Error Handling and Retry Policies**

    - **Asynchronous Invocation**: Lambda automatically retries asynchronous invocations (e.g., from S3, SNS, CloudWatch) up to two times if there’s an error. You can configure the retry attempts to 0, 1, or 2.
    - **Event Source Mapping**: For sources like SQS, Kinesis, and DynamoDB streams, Lambda retries until the message expires, is processed successfully, or is moved to a **destination** or **DLQ** after a set number of attempts.
    - **Destinations**: With **AWS Lambda destinations**, you can route successful or failed asynchronous invocations to an SNS topic, SQS queue, EventBridge, or another Lambda function, which allows for advanced error handling and processing workflows.

8. **Logging and Monitoring**: AWS Lambda integrates with **Amazon CloudWatch** for logging, monitoring, and observability.

    - `CloudWatch Logs`: Every function invocation produces logs, which can be viewed and monitored through CloudWatch. Lambda sends logs of function execution (including errors, timeouts, and custom logs) to Amazon CloudWatch by default. These logs are useful for debugging, monitoring, and performance tuning.
    - `X-Ray Tracing`: AWS X-Ray provides insights into function performance and latency by tracing requests as they pass through the application. It helps pinpoint bottlenecks, understand dependencies, and monitor overall performance.

    - `Invocations`: The number of times a function is called.
    - `Errors`: The number of errors that occurred during function execution.
    - `Duration`: The time it took for the function to execute.
    - `Throttles`: The number of times the function was throttled due to reaching the concurrency limit.

9. **File System (EFS) Configuration**

    - **Amazon EFS (Elastic File System)**:
        - Allows Lambda functions to access a persistent file system across function invocations. This is helpful for functions that require shared storage, such as large models or datasets.
        - EFS can be mounted on Lambda functions configured within a VPC, and it’s useful for stateful workloads or functions with large code dependencies that exceed Lambda’s 10 GB limit.

10. **Function Code Configuration**

-   **Deployment Package**:
    -   A Lambda function’s deployment package contains the function code and dependencies, packaged in a `.zip` file or container image.
    -   **Layers**: Lambda layers let you share code, libraries, or binaries across multiple Lambda functions without including them in each function’s deployment package. Up to 5 layers can be used per function, reducing package size and simplifying maintenance.
-   **Container Images**:
    -   Lambda supports container images up to 10 GB, allowing you to package code and dependencies in Docker images for more complex applications or specific runtime requirements.
    -   Images are stored in Amazon ECR and provide a way to deploy large applications with custom runtimes or dependencies.

11. **Aliases and Versions**

-   **Versions**: Lambda functions can be versioned, with each published version being immutable. Versions allow you to reference specific function code and configuration states, providing stability for production applications.
-   **Aliases**: An alias is a pointer to a specific function version, often used to manage different environments (e.g., `dev`, `test`, `prod`). Aliases allow routing traffic between versions and enable canary deployments by splitting traffic to different versions.

#### Concurrency and Scaling

**Concurrency** in AWS Lambda refers to the number of instances (or executions) of a function that can run simultaneously. AWS Lambda is inherently scalable and can handle multiple invocations in parallel, but understanding how concurrency works is crucial for ensuring predictable scaling behavior. You can manage concurrency to control costs and limit resource usage. AWS Lambda’s concurrency and scaling capabilities are essential for building scalable, serverless applications. Here’s a breakdown of key terms and concepts related to concurrency and scaling in AWS Lambda:

1. **Concurrency Limit**:

    - AWS Lambda has default concurrency limits, which can be adjusted within AWS account settings. This limit is important for managing the maximum number of concurrent executions your account can have across all Lambda functions.
    - Concurrency settings help ensure that Lambda functions don't overwhelm downstream services, databases, or other resources by invoking too many instances at once.

2. **Reserved Concurrency**:

    - Reserved concurrency is the maximum number of concurrent executions that a specific Lambda function can handle. This is an optional configuration that isolates a portion of account-wide concurrency for a specific Lambda function.
    - For example, if you reserve concurrency of `50` for one Lambda function, AWS guarantees that up to 50 concurrent executions of that function will run, while preventing it from using more than 50 concurrent executions and consuming resources that other functions need.

3. **Provisioned Concurrency**:

    - Provisioned concurrency is a feature designed to reduce the latency of Lambda functions. It pre-warms a specific number of instances to ensure they are immediately available when requests arrive, preventing cold starts (the delay from initializing resources when a function is first invoked).
    - This is particularly useful for applications where low latency is critical, such as interactive applications or APIs that require consistent response times.

4. **Cold Start**

    - A **cold start** occurs when AWS Lambda needs to initialize a new environment for an incoming request. When a Lambda function is invoked, AWS must set up resources such as the execution environment, runtime, and dependencies.
    - Cold starts can lead to latency in the initial request. For functions that require low latency, cold starts can be mitigated by using **Provisioned Concurrency** or by periodically invoking the function to keep it "warm."

5. **Auto Scaling**

    - AWS Lambda automatically scales based on the number of incoming requests and concurrency limits. When more requests arrive than existing Lambda instances can handle, AWS Lambda automatically scales up by creating new instances.
    - This process is automatic and can handle bursts of traffic efficiently, but scaling is limited by concurrency configurations, reserved concurrency, and account-wide concurrency quotas.

6. **Burst Concurrency**

    - **Burst concurrency** is the initial scaling capacity that AWS Lambda provides within a short time for functions within a particular AWS Region.
    - AWS Lambda can initially handle a burst of 500 to 3000 concurrent requests per second (depending on the Region). After this burst, Lambda gradually scales up at a rate of 500 additional concurrent invocations per minute until it reaches the maximum concurrency limit of the AWS account.

7. **Throttling**

    - Throttling occurs when AWS Lambda exceeds its maximum concurrency limit (either at the account level or at the function level through reserved concurrency).
    - When throttling happens, additional requests to a Lambda function are rejected with a `429 TooManyRequests` error. To handle this, the calling service (like API Gateway or SQS) can implement retry logic, or you can increase concurrency limits if throttling is frequent.

8. **Scaling Behavior and Invocation Model**

    - **Synchronous Invocations**:
        - In synchronous invocations (like those triggered by API Gateway, AWS SDK, or application integrations), Lambda returns the response immediately after execution, and the caller waits for the function to complete.
        - When the request rate exceeds the function’s concurrency limit, new synchronous invocations are throttled.
    - **Asynchronous Invocations**: For asynchronous invocations (like those triggered by S3 or CloudWatch Events), Lambda queues the events. It then retries these events if they fail or are throttled until they succeed or until Lambda exhausts the retry limit.
    - **Event Source Mapping**: When integrating Lambda with services like Amazon SQS or Kinesis (stream-based services), Lambda reads and processes events as they arrive in the source. The scaling of Lambda for these integrations is determined by the event source's processing characteristics and partitioning.

9. **Lambda Scaling with Event Sources**

    - **Amazon SQS**: Lambda can process up to 10 messages at a time from a single Amazon SQS queue and scales horizontally as the number of messages increases, limited by concurrency.
    - **Amazon Kinesis and DynamoDB Streams**:
        - Lambda scaling with Kinesis or DynamoDB streams is partitioned. AWS Lambda processes records from each shard or partition concurrently, but only one Lambda instance can process data from a specific shard at a time.
        - The number of shards defines the maximum concurrency Lambda can achieve with these sources, so you may need to increase the shard count if the function requires greater concurrency.

10. **Concurrency Scaling Considerations**: Concurrency affects costs, latency, and performance, so configuring concurrency properly is key to balancing efficiency and cost in AWS Lambda:

    - **Cost**: Each instance adds cost, so unbounded concurrency can lead to high expenses. Reserved and provisioned concurrency options give finer control over costs.
    - **Latency**: Low-latency applications may need provisioned concurrency to avoid cold starts.
    - **Throttling Impact**: Throttling at peak times can cause delays or errors in applications, making it important to monitor concurrency usage and plan capacity according to traffic patterns.

11. **Monitoring and Scaling Metrics**: AWS provides metrics in CloudWatch that help in monitoring and tuning Lambda function scaling:
    - **ConcurrentExecutions**: Shows the total concurrent executions in the account.
    - **UnreservedConcurrentExecutions**: Reflects concurrency left after reserved concurrency allocations.
    - **Throttles**: Indicates throttling events due to exceeded concurrency limits, helping identify scaling needs.

#### Lambda Throttling:

Lambda throttling is a mechanism used in AWS Lambda to limit the rate at which function executions can occur. This mechanism helps protect your resources and ensures the smooth operation of your AWS infrastructure by preventing a Lambda function from being overwhelmed with excessive requests. AWS Lambda provides two types of throttling:

-   `Concurrent Execution Throttling`:

    -   Concurrent execution throttling limits the number of function executions that can run simultaneously. AWS imposes a default concurrency limit on your AWS account and can adjust this limit upon request.
    -   When the limit is reached, AWS will queue any additional invocation requests. These queued requests will be processed as soon as existing executions complete and resources become available. Throttled invocations do not result in errors; they are simply delayed.
    -   You can view and modify the concurrent execution limit for a specific function in the AWS Lambda Management Console.

-   `Invocation Throttling`:

    -   Invocation throttling occurs when you send too many requests to invoke a Lambda function in a short period. This can happen when you repeatedly call the function with a high request rate.
    -   AWS enforces soft limits on the number of requests per second (RPS) that can be sent to a function. If you exceed these soft limits, AWS may throttle your requests, resulting in delays and retries.
    -   To mitigate invocation throttling, you can:
        -   Implement exponential backoff and retries in your code to handle throttled requests gracefully.
        -   Request a limit increase from AWS Support if your workload requires a higher request rate.

-   `Implement Retries`: Build retry logic with exponential backoff into your Lambda client code to handle throttled requests and retries automatically.
-   `Error Handling`: Check for error codes in the Lambda response to detect throttled invocations and take appropriate action.
-   `Throttle Metrics`: Monitor CloudWatch metrics, such as `Throttles` and `ThrottleCount` to gain insight into the rate of throttled invocations.
-   `Limit Increases`: If you anticipate higher traffic, request a concurrency limit increase from AWS Support. Ensure that your architecture and resource usage can handle the increased load.
-   `Batch Processing`: If you're processing large numbers of records, consider batch processing to reduce the rate of function invocations.
-   `Distributed Workloads`: Distribute workloads across multiple Lambda functions to avoid overwhelming a single function.
-   `Provisioned Concurrency`: Consider using AWS Lambda Provisioned Concurrency to pre-warm your functions, ensuring that they can handle surges in traffic without experiencing cold start delays.

#### AWS Lambda Destinations

AWS Lambda Destinations provides a powerful mechanism for handling the asynchronous invocation results of a Lambda function. When a Lambda function is invoked asynchronously (for example, by S3, SNS, or other AWS services), Lambda Destinations can automatically route the outcome (success or failure) to a target destination for further processing.
**Destinations** allow you to specify what happens after the execution of a Lambda function, based on success or failure.

-   **Lambda Destinations supports two types of routes**:

    -   `OnSuccess`: Defines where to send the successful result of an asynchronous invocation.
    -   `OnFailure`: Defines where to send the result in case of failure during invocation.

-   **Key Differences from Dead Letter Queue (DLQ)**

    -   DLQ captures only failed invocations.
    -   Destinations captures both successes and failures, and allows more flexibility in routing events.

-   **Supported Destination Targets**:
    -   `SNS`: Notify users or systems of function success/failure.
    -   `SQS`: Queue events for further processing.
    -   `EventBridge`: Route events for automation workflows.
    -   `Another Lambda Function`: Trigger another Lambda function.

#### Event Sources / Triggers

**Event sources** are AWS services or external systems that generate events that can trigger a Lambda function to execute. These triggers define when and how Lambda functions are invoked.

-   **Common Event Sources**:
    -   **S3**: Lambda can trigger when an object is created or deleted in an S3 bucket.
    -   **API Gateway**: Lambda can be invoked via HTTP requests, making it suitable for serverless APIs.
    -   **SNS (Simple Notification Service)**: Lambda can process messages from SNS.
    -   **SQS (Simple Queue Service)**: Lambda can process messages from SQS queues.
    -   **CloudWatch Events**: Lambda can trigger on scheduled events or based on system events (e.g., EC2 instance state change).
    -   **DynamoDB Streams**: Lambda can trigger on changes in DynamoDB tables.

#### Lambda Execution Environment

The **execution environment** is the runtime in which Lambda functions run. AWS Lambda automatically manages the environment that runs your code, scaling it based on demand.

-   **Features**:
    -   **Isolated environment**: Functions run in isolated environments to ensure security.
    -   **Runtime management**: AWS manages the language runtime and updates it.
    -   **Environment variables**: Allows the use of environment variables for dynamic configuration.

#### Lambda Layers

**Lambda layers** allow you to package external libraries, dependencies, or configuration files separately from your function code. These layers can be shared across multiple Lambda functions, reducing code duplication and improving maintainability.

-   **Features**:
    -   You can include libraries, custom runtimes, or configuration data.
    -   You can use up to 5 layers per Lambda function.
    -   Layers can be reused by multiple Lambda functions or shared across accounts.

#### Lambda Pricing Model

AWS Lambda follows a pay-per-use model, where you're charged based on the number of function invocations and the compute time used.

-   **Pricing Factors**:
    -   **Number of invocations**: Charged for every request.
    -   **Compute time**: Charged based on the function's memory and execution duration, measured in milliseconds.

#### Asynchronous and Synchronous Invocations

AWS Lambda supports both **synchronous** and **asynchronous** invocations, depending on how you need the function to interact with other systems.

-   **Synchronous invocation**: The caller waits for the function to complete before continuing (e.g., API Gateway).
-   **Asynchronous invocation**: The caller doesn't wait for the function to complete (e.g., S3 event notifications, SNS).

#### AWS Lambda@Edge

**Lambda@Edge** is an extension of AWS Lambda that allows you to run code closer to users (at Amazon CloudFront edge locations), reducing latency for global users.

-   **Features**:
    -   Modify content delivery and customize responses for users.
    -   Perform operations like URL rewrites, header manipulations, and cache key customizations.

---

---

#### Features of Lambda Function

-   `Serverless Execution`: AWS Lambda allows you to run your code without managing servers. You upload your code, and AWS Lambda takes care of provisioning and scaling the infrastructure needed to execute it.
-   `Event-Driven Execution`: Lambda functions can be triggered by various AWS services or custom events. Examples of triggers include changes to data in an S3 bucket, updates to a DynamoDB table, or HTTP requests through API Gateway.
-   `Supported Runtimes`: Lambda supports multiple programming languages, known as runtimes. These include Node.js, Python, Java, Ruby, Go, .NET, and custom runtimes through the use of custom execution environments.
-   `Automatic Scaling`: Lambda automatically scales your applications in response to incoming traffic. Each function can scale independently, and you pay only for the compute time consumed.
-   `Built-in Fault Tolerance`: AWS Lambda maintains compute capacity, and if a function fails, it automatically retries the execution. If a function execution fails repeatedly, Lambda can be configured to send the event to a Dead Letter Queue (DLQ) for further analysis.
-   `Integrated Logging and Monitoring`: Lambda provides built-in logging through Amazon CloudWatch. You can monitor the performance of your functions, view logs, and set up custom CloudWatch Alarms to be notified of specific events or issues.
-   `Environment Variables`: Lambda allows you to set environment variables for your functions. These variables can be used to store configuration settings or sensitive information, such as API keys.
-   `Execution Role and Permissions`: Each Lambda function is associated with an IAM (Identity and Access Management) role that defines the permissions needed to execute the function and access other AWS resources.
-   `Stateless Execution`: Lambda functions are designed to be stateless. However, you can store persistent data using other AWS services like Amazon S3, DynamoDB, or AWS RDS.
-   `Cold Starts and Warm Containers`: Cold starts occur when a function is invoked for the first time or when there is a need to scale. Subsequent invocations reuse warm containers, reducing cold start times.
-   `VPC Integration`: Lambda functions can be integrated with a VPC (Virtual Private Cloud), allowing them to access resources inside a VPC, such as databases, and allowing private connectivity.
-   `Cross-Region Execution`: You can configure Lambda functions to run in different AWS regions, providing flexibility and redundancy.
-   `Versioning and Aliases`: Lambda supports versioning and aliases, allowing you to manage different versions of your functions and direct traffic to specific versions.
-   `Maximum Execution Duration`: Each Lambda function has a maximum execution duration (timeout) that can be set. If the function runs longer than the specified duration, it is terminated.
-   `Immutable Deployment Packages`: Once a Lambda function is created, its deployment package (code and dependencies) becomes immutable. If you need to make changes, you create a new version of the function.

#### Limitation on Lambda Functions:

-   `Execution timeout`: The maximum execution time for a Lambda function is `900 seconds (15 minutes)`.
-   `Concurrent executions`: By default, there is a soft `limit of 1,000 concurrent executions per account per region`. However, you can request a higher limit if you need it.
-   `Environment variables`: You can set environment variables for your Lambda function, but `the maximum size of all environment variables combined is 4 KB`.

-   `Deployment package size`: `The maximum compressed deployment package size for a Lambda function is 50 MB`. There are some exceptions for certain runtimes, as outlined in my previous answer.

    -   Uncompressed code & dependencies < 250 MB
    -   Compressed function package < 50MB
    -   Total function packages in a region < 75 GB
    -   Ephemeral storage < 512 MB
    -   Maximum execution duration < 900 seconds
    -   Concurrent Lambda functions < 1000

-   `Memory allocation`: Up to 10 GB of memory to a Lambda function. The amount of memory you allocate also determines the amount of CPU and network resources that the function gets.
    -   `Memory allocation`: Up to 10 GB of memory starting from 128 MB with CPU 3GB.
-   `Execution environment`: Lambda functions run in a stateless execution environment, so you can't store data on the local file system. However, you can use other AWS services like S3 or DynamoDB to store data.
-   `Function invocations`: You can trigger a Lambda function in several ways, including through `API Gateway`, `S3 events`, `SNS notifications`, and more. However, there may be some limits or quotas on the number of invocations you can make in a given period.

#### Usecases of Lambda

AWS Lambda is a serverless compute service that lets you run code without provisioning or managing servers. It's often used for various use cases across different industries. Here are the top five most common use cases for AWS Lambda:

-   **Event-Driven Processing**: AWS Lambda is frequently used to process events from various AWS services, such as Amazon S3, Amazon DynamoDB, Amazon SNS, Amazon SQS, and more. For example, you can trigger Lambda functions to process new objects uploaded to an S3 bucket, process messages from an SQS queue, or react to changes in a DynamoDB table.

-   **Real-time File Processing**: Lambda functions can be used for real-time processing of data streams. For instance, you can use Lambda to analyze streaming data from Amazon Kinesis Data Streams or process logs from Amazon CloudWatch Logs in real-time.

-   **Backend for Web Applications**: Lambda functions can serve as the backend for web applications, providing scalable and cost-effective compute resources. You can build APIs using AWS API Gateway and trigger Lambda functions to handle incoming HTTP requests, allowing you to build serverless web applications without managing infrastructure.

-   **Scheduled Tasks and Cron Jobs**: Lambda functions can be scheduled to run at specific intervals using AWS CloudWatch Events. This allows you to automate tasks such as data backups, log archiving, or regular data processing jobs without needing to maintain dedicated servers or cron jobs.

-   **Data Processing and ETL**: Lambda functions are commonly used for data processing and ETL (Extract, Transform, Load) tasks. You can trigger Lambda functions to process data as soon as it becomes available, perform transformations on the data, and then load it into a data warehouse or database. This approach enables real-time or near-real-time data processing without the need for complex infrastructure.

</details>

---

<details><summary style="font-size:25px;color:Orange">CloudWatch</summary>

-   [Be a Better Dev: AWS Cloudwatch Guides - Learn AWS Monitoring Techniques](https://www.youtube.com/playlist?list=PL9nWRykSBSFir2FLla2thQkEwmLpxPega)
-   [What is AWS CloudWatch? Metric | Alarms | Logs Custom Metric](https://www.youtube.com/watch?v=G4_ay2_h9GI)

Amazon CloudWatch is a monitoring service provided by Amazon Web Services (AWS) that allows you to monitor and collect metrics, collect and monitor log files, and set alarms. Here are some important terms and concepts related to AWS CloudWatch:

-   `Metrics`: A metric is a variable that you want to monitor, such as CPU usage, disk space usage, or network traffic. CloudWatch provides a set of predefined metrics for AWS resources, and you can also create your own custom metrics.
-   `Events`: CloudWatch Events is a service that allows you to monitor and respond to changes in your AWS resources. You can create rules that trigger automated actions when certain events occur, such as launching an EC2 instance or creating a new S3 bucket.
    -   `Event Sources`: an "event source" refers to the entity or service that generates events that CloudWatch Events can capture and process. An event source is the origin or producer of events that you want to monitor and respond to within the AWS ecosystem. CloudWatch Events can capture events from various AWS services and custom applications, and each of these sources is considered an event source.
-   `Alarms`: An alarm is a notification that is triggered when a metric breaches a specified threshold. You can configure CloudWatch to send notifications to various destinations, such as email, SMS, or other AWS services.
-   `Rules`: A rule matches incoming events and routes them to targets for processing. A single rule can route to multiple targets, all of which are processed in parallel. Rules are not processed in a particular order. A rule can customize the JSON sent to the target, by passing only certain parts or by overwriting it with a constant.
-   `Target`: A target processes events. Targets can include Amazon EC2 instances, AWS Lambda functions, Kinesis streams, Amazon ECS tasks, Step Functions state machines, Amazon SNS topics, Amazon SQS queues, and built-in targets. A target receives events in JSON format.
-   `Dashboards`: A dashboard is a customizable view of metrics and alarms that you can create to monitor the health and performance of your AWS resources. You can add multiple metrics and alarms to a single dashboard, and you can create multiple dashboards to monitor different aspects of your infrastructure.
-   `Logs`: CloudWatch Logs is a service that allows you to collect, monitor, and store log files generated by your applications and AWS resources. You can also use CloudWatch Logs to search and analyze log data.
    -   `Log Groups`: Log groups are containers for log streams.
    -   `Log Streams`: Log streams represent the sequence of log events coming from a specific source, such as an EC2 instance or Lambda function.
-   `Retention periods`: CloudWatch allows you to specify how long you want to retain your metric data and log data. By default, CloudWatch retains` metric data for 15 months` and `log data for 30 days`, but you can customize these retention periods to suit your needs.
-   `Namespaces`: A namespace is a container for CloudWatch metrics. AWS resources are organized into namespaces, and you can create custom namespaces for your own metrics.
-   `Dimensions`: A dimension is a name-value pair that helps you to uniquely identify a metric. For example, a dimension for an EC2 instance might include the instance ID and the region where the instance is running.
-   `CloudWatch Agent`: The CloudWatch agent is a software component that you can install on your EC2 instances to collect and send system-level metrics and logs to CloudWatch. The agent supports both Windows and Linux operating systems.

#### CloudWatch Events vs EventBridge

Amazon Web Services (AWS) provides two services for managing events and automating responses: Amazon CloudWatch Events and Amazon EventBridge. While both services are designed for event-driven architectures, they have some key differences in terms of functionality and use cases.

-   `AWS CloudWatch Events`:

    -   `Use Case`: CloudWatch Events primarily focuses on events related to AWS resources. It is designed for monitoring and reacting to events from AWS services, such as EC2, Lambda, S3, and more.
    -   `Event Sources`: It integrates with AWS services and can capture events from those services. These events are typically related to resource changes, operational activities, and management.
    -   `Targets`: CloudWatch Events can route events to targets such as AWS Lambda functions, Amazon SNS topics, Kinesis streams, and more.
    -   `Event Rules`: You can create event rules that define which events to capture and how to respond to them. These rules are based on events from AWS services.
    -   `Retention`: CloudWatch Events retains events for a maximum of 1 or 2 weeks, depending on the event source.

-   `AWS EventBridge`:

    -   `Use Case`: EventBridge, previously known as CloudWatch Events bus, is an advanced event bus service. It is designed for a broader range of event sources and use cases, including AWS services and custom applications.
    -   `Event Sources`: EventBridge can capture events from both AWS services and custom applications, making it suitable for hybrid and multi-cloud environments.
    -   `Schema Registry`: It includes a schema registry that allows you to define the structure of events, making it easier to work with event data.
    -   `Event Buses`: EventBridge supports multiple event buses that allow you to segment and manage events effectively. Each bus can have its own permissions and event sources.
    -   `Targets`: Similar to CloudWatch Events, EventBridge can route events to AWS Lambda functions, SNS topics, Kinesis streams, and more.
    -   `Archiving`: EventBridge offers event archiving, which allows you to retain events for a longer duration than CloudWatch Events.
    -   `Rules and EventBridge API`: EventBridge introduces more advanced rules and support for the EventBridge API, providing finer-grained control over event routing and transformation.

-   `Key Considerations`:

    -   If you primarily need to handle AWS service events, CloudWatch Events may suffice.
    -   If you need to manage events from custom applications, multiple AWS accounts, or other AWS services in a more structured and scalable way, EventBridge is a better choice.
    -   EventBridge is often the preferred service for building event-driven architectures for microservices, serverless applications, and complex integrations.

In summary, AWS CloudWatch Events is a specialized service for AWS resource events, while AWS EventBridge is a more versatile event bus service designed for a broader range of event sources and use cases, including custom applications and multi-cloud environments. Your choice depends on your specific use case and requirements.

</details>

---

<details><summary style="font-size:25px;color:Orange">S3</summary>

Amazon S3 (Simple Storage Service) is a highly scalable, durable, and secure object storage service provided by Amazon Web Services (AWS). It is designed to store and retrieve any amount of data from anywhere on the web, making it a fundamental building block for many cloud-based applications. S3 is widely used for data storage, backup and restore, content distribution, big data analytics, archiving, and much more.

-   `Bucket`: A bucket is a container for storing objects in Amazon S3. All objects are stored in buckets, and each bucket has a globally unique name that must adhere to specific naming rules. Buckets act as the top-level namespace in S3.
-   `Object`: An object is the basic unit of data in Amazon S3. It can be any file, data, or media, including text files, images, videos, and more. Objects consist of the actual data, a key (or identifier), and metadata (optional attributes).
-   `Key`: The key is the unique identifier for an object within a bucket. It is similar to a file path and is used to retrieve objects from S3. For example, if an object is stored at the path "my-folder/image.jpg", the key would be "my-folder/image.jpg"
-   `Region`: A region is a geographical area where S3 stores data. Each bucket is associated with a specific AWS region, and the data within that bucket is physically stored in data centers located in that region.
-   `Access Control List (ACL)`: An ACL is a set of permissions attached to each object and bucket, defining who can access the objects and what actions they can perform (e.g., read, write, delete). While still supported, IAM policies are now generally recommended for controlling access to S3 resources.
-   `AWS Identity and Access Management (IAM)`: IAM is AWS's identity management service, which allows you to control access to AWS resources. You can use IAM to manage user access to S3 buckets and objects through IAM policies.
-   `Object Versioning`: S3 supports versioning, which allows you to keep multiple versions of an object in the same bucket. It helps protect against accidental deletions or overwrites, and you can easily restore previous versions of objects.
-   `Server-Side Encryption`: S3 provides server-side encryption to protect data at rest. You can choose to have S3 automatically encrypt your objects using AWS Key Management Service (KMS) keys or Amazon S3 managed keys.
-   `Lifecycle Policies`: Lifecycle policies allow you to automatically transition objects between different storage classes or delete objects after a specific period. This helps optimize storage costs and manage data lifecycle.
-   `Cross-Region Replication (CRR)`: CRR is a feature that allows you to replicate objects from one S3 bucket to another bucket in a different AWS region. It provides data redundancy and disaster recovery capabilities.
-   `Event Notifications`: S3 allows you to set up event notifications to trigger actions (e.g., invoking an AWS Lambda function) when specific events occur, such as object creation or deletion.
-   `Access Logs`: You can enable access logging for S3 buckets to track all requests made to the bucket. Access logs are stored in a separate bucket and can help with auditing and monitoring.

</details>

---

<details><summary style="font-size:25px;color:Orange">SNS, SQS & EventBridge</summary>

#### SNS

Amazon Simple Notification Service (SNS) is a messaging service provided by Amazon Web Services (AWS) that enables the publishing and delivery of messages to multiple subscribers or endpoints. Here are some important terms and concepts related to AWS SNS:

![sns](../assets/aws/sns.png)

-   `Topic`: A topic is a communication channel in SNS. Publishers send messages to a topic, and subscribers receive messages from a topic. A topic can have one or more subscribers.

    ```python
    sns = boto3.client('sns')
    sns.publish(
        TopicArn='ARN_OF_EC2StateChangeTopic',
        Message=message,
        Subject='EC2 State Change Notification'
    )
    ```

-   `Subscription`: A subscription is a request to receive messages from a topic. Subscribers can receive messages via a variety of protocols, such as email, SMS, HTTP, HTTPS, Lambda, or mobile push notifications.
-   `Publisher`: A publisher is an entity that sends messages to a topic. Publishers can be AWS services or applications that use an SNS client.
-   `Message`: A message is the content that is sent to a topic. Messages can be up to 256 KB in size and can be in a variety of formats, including text, JSON, and binary data.
-   `Protocol`: A protocol is the method used to send messages to subscribers. SNS supports multiple protocols, including HTTP, HTTPS, email, SMS, Lambda, and mobile push notifications.
-   `Endpoint`: An endpoint is the destination for a message. Endpoints can be email addresses, mobile device tokens, HTTP/HTTPS URLs, or Amazon resource names (ARNs) for Lambda functions.
-   `ARN`: An Amazon Resource Name (ARN) is a unique identifier for an AWS resource, such as an SNS topic or a Lambda function.
-   `Message filtering`: SNS allows you to filter messages based on attributes or message content. This enables you to send targeted messages to specific subscribers.
-   `Dead-letter queue`: A dead-letter queue is a queue where messages are sent if they cannot be delivered to their intended recipients. SNS provides support for dead-letter queues to help you troubleshoot message delivery issues.
-   `Message attributes`: SNS allows you to add custom attributes to messages, which can be used for filtering and routing messages to specific subscribers.
-   `Access policies`: SNS allows you to control access to topics and subscriptions using access policies. Access policies define which AWS accounts or users are authorized to perform specific actions on a topic or subscription.
-   `SNS Mobile Push`: SNS provides a mobile push service that enables you to send push notifications to iOS, Android, and Kindle Fire devices. SNS Mobile Push supports Apple Push Notification Service (APNS), Google Cloud Messaging (GCM), Firebase Cloud Messaging (FCM), and Amazon Device Messaging (ADM).

#### SQS:

Amazon Simple Queue Service (SQS) is a fully managed message queuing service provided by Amazon Web Services (AWS) that enables you to decouple and scale microservices, distributed systems, and serverless applications. Here are some important terms and concepts related to AWS SQS:

![sqs](../assets/aws/sqs.png)

-   `Queue`: A queue is a container for messages in SQS. Queues allow messages to be stored and retrieved asynchronously between components or services.

-   `Message`: A message is the information being sent between components or services. Messages can contain up to 256KB of text in any format.
-   `Producer`: A producer is a system or application that sends messages to a queue.
-   `Consumer`: A consumer is a system or application that receives messages from a queue.
-   `Visibility timeout`: When a consumer retrieves a message from a queue, the message becomes "invisible" to other consumers for a specified period of time known as the visibility timeout. This allows the consumer time to process the message without the risk of another consumer processing the same message.
-   `Long polling`: Long polling is a method of retrieving messages from a queue where the request to retrieve messages stays open for an extended period of time, waiting for new messages to arrive. This reduces the number of empty responses and can improve the efficiency of message retrieval.
-   `Dead-letter queue`: A dead-letter queue is a queue where messages are sent if they cannot be processed successfully by a consumer. SQS provides support for dead-letter queues to help you troubleshoot message processing issues.
-   `FIFO queue`: A FIFO queue is a queue that supports "first-in, first-out" ordering of messages. FIFO queues are designed for applications that require the exact order of messages to be preserved.
-   `Standard queue`: A standard queue is a queue that provides at-least-once delivery of messages. Standard queues are designed for applications that can handle the possibility of duplicate messages or messages that are not delivered in the exact order they were sent.
-   `Message attributes`: SQS allows you to add custom attributes to messages, which can be used for filtering and routing messages to specific consumers.
-   `Access policies`: SQS allows you to control access to queues using access policies. Access policies define which AWS accounts or users are authorized to perform specific actions on a queue.
-   `Batch operations`: SQS supports batch operations that allow you to send, delete, or change the visibility timeout of multiple messages in a single API call.
-   `Delay queues`: Delay queues allow you to delay the delivery of messages for a specified amount of time, up to 15 minutes. This can be useful for scenarios where messages need to be delayed until certain conditions are met.

#### EventBridge:

![event_bridge](../assets/aws/event_bridge.png)

-   `Event-Driven Architecture`: Amazon EventBridge facilitates event-driven architecture, where services or applications communicate by emitting and consuming events. An event can be anything from a simple notification to a significant change in your application's state.

Amazon EventBridge is a serverless event bus service that simplifies the building of event-driven architectures. It enables you to connect different AWS services, SaaS applications, and custom applications using events, making it easier to build scalable, decoupled, and flexible applications.
AWS EventBridge is a serverless event bus service that enables you to connect applications using data from your own apps, integrated Software-as-a-Service (SaaS) apps, and AWS services. It simplifies event-driven architectures, allowing services to communicate through events. Below are the crucial components and concepts in AWS EventBridge:

-   **Events**: An **event** is a data record that signifies a change in the state of a system, application, or AWS resource. The event is in JSON format and contains details like the source of the event, the event type, and the event data (payload).

    -   Events in EventBridge are typically generated by:
        -   AWS services (e.g., S3 file creation).
        -   Custom applications.
        -   Integrated SaaS applications.

-   **Event Buses**: EventBridge uses an event bus, a central message broker that receives and distributes events to the relevant targets. The event bus acts as the intermediary for the communication between different event sources and event targets.

    -   **Event Bus** is the central component where events are sent and from where they are routed to the appropriate targets.
        -   **Default Event Bus**: Every AWS account has a default event bus that receives events from AWS services (e.g., EC2, S3).
        -   **Custom Event Bus**: You can create custom event buses for your applications or microservices to handle specific events.
        -   **SaaS Partner Event Bus**: SaaS applications can send events directly to your event bus using partner event sources.

-   **Event Patterns**: Event Pattern is a set of conditions used to filter and match specific events based on their attributes or content. Event patterns help you identify which events you want to capture and respond to by defining criteria that events must meet before they are processed by rules in EventBridge.

    -   **Event Patterns** are used in rules to filter events and specify which events should trigger a specific rule.
    -   Patterns can match specific fields in an event, such as event source, detail type, or the contents of custom event data.
    -   EventBridge checks incoming events against defined patterns, and when there’s a match, it routes the event to the specified target.

-   **Rules**: A rule in AWS EventBridge is a configuration that matches incoming events to specific patterns and routes them to one or more target destinations, such as AWS Lambda, SQS, or other services. Rules act as filters, ensuring that only events that meet the defined criteria trigger the specified actions. - **Event Pattern Matching**: EventBridge matches events to rules based on defined event patterns, which are JSON objects that specify the structure and content of the event to be matched. - Rules can trigger multiple targets when a matching event is received. Each rule can have one or more targets.

-   **Targets**: Targets are the destination resources or services where events are routed after being matched by a rule.

    -   Some common targets include:
        -   AWS Lambda functions
        -   Step Functions
        -   Amazon SNS or SQS for messaging
        -   Kinesis Streams or Firehose for data streaming
        -   Amazon EC2 or ECS
        -   Other event buses (you can route events between buses)

-   **Event Sources**: Event sources are the entities that emit events to EventBridge. AWS services, such as AWS CloudTrail, Amazon S3, or AWS Step Functions, can be event sources. Custom applications and SaaS applications can also emit events to EventBridge using the PutEvents API.

    -   **Event Sources** are the entities that generate events. EventBridge can handle events from:
        -   **AWS services**: Many AWS services (e.g., S3, EC2) automatically emit events when specific actions occur.
        -   **Custom Event Producers**: Your own applications or microservices can act as event sources, publishing custom events to EventBridge.
        -   **SaaS Applications**: Third-party SaaS applications can send events to your EventBridge using SaaS partner integration.

-   **Schemas Registry**

    -   **Schema Registry** allows you to automatically discover and manage event schemas used by EventBridge.
        -   **Schema Discovery**: When you enable schema discovery, EventBridge automatically analyzes incoming events and creates a schema for them.
        -   Schemas can be downloaded as code bindings for programming languages like Python or Java to make it easier to work with events in your code.

-   **Key Use Cases for AWS EventBridge**:

    -   `Event-Driven Architectures`: Helps decouple microservices, where services react to events without direct communication.
    -   `Monitoring and Automation`: Trigger workflows or Lambda functions in response to events like EC2 state changes or file uploads in S3.
    -   `SaaS Integrations`: Seamlessly integrate third-party SaaS services like Zendesk, Datadog, or Shopify into your AWS environment.

</details>

---

<details><summary style="font-size:25px;color:Orange">API Gateways</summary>

![API Gateway](../assets/aws/APIGateway.png)

AWS API Gateway is a fully managed service that makes it easy for developers to create, publish, and manage APIs at any scale. It provides a way to create **RESTful APIs**, **WebSocket APIs**, and **HTTP APIs** that can be used to interact with back-end services, such as AWS Lambda, Amazon EC2, and other AWS services, as well as with third-party services.
AWS API Gateway is a fully managed service that enables developers to create, publish, and manage **RESTful APIs**, **WebSocket APIs**, and **HTTP APIs** at any scale. It serves as a front-door to various backend services like AWS Lambda, EC2, or any web application. Here are the crucial concepts and components of **AWS REST API Gateway**:
These components and concepts make API Gateway a robust and scalable solution for creating and managing REST APIs, with seamless integration into the AWS ecosystem. API Gateway allows you to build secure, flexible, and scalable APIs that can interact with a variety of backends, including serverless services like AWS Lambda.
The **REST API** in API Gateway allows developers to create RESTful web services that can interact with a wide range of backend services. API Gateway acts as an intermediary between the client and the backend.

-   **Components**:
    -   **Resources**: Logical endpoints in your API that represent entities or operations.
    -   **Methods**: HTTP methods (e.g., GET, POST, PUT, DELETE) applied to resources.
    -   **Stages**: Different deployment environments (e.g., dev, test, prod) with unique URLs.

#### Resources:

**Resources** represent individual endpoints in your API, which map to a particular functionality or entity in your application.
A resource is an object that represents an entity, such as a customer, order, or product, in the context of an API. Each resource is associated with one or more methods, such as GET, POST, PUT, DELETE, that can be used to access or manipulate the resource's data.

-   **Path Parameters**: Resources can include path parameters (e.g., `/users/{user_id}`) to pass variables within the URL.
-   **Nested Resources**: You can create hierarchical resource paths (e.g., `/users/{user_id}/orders`) to organize related API endpoints.

#### Methods:

Each resource in a REST API can have one or more **HTTP methods** associated with it, defining how the resource can be interacted with (e.g., GET, POST, PUT, DELETE).
A method is an action that can be performed on a resource, such as retrieving, updating, or deleting data. Each method is associated with an HTTP verb, such as GET, POST, PUT, or DELETE, that indicates the type of action that is being performed.

-   **Integration with Backends**: Methods define how the API Gateway interacts with backend services, such as AWS Lambda functions, Amazon EC2, or HTTP endpoints.
-   **Input/Output Mapping**: Request and response payloads can be transformed or mapped to fit the backend’s format using **mapping templates**.

#### Stages:

A **stage** in API Gateway is a logical separation of your API for different environments such as development, testing, or production.

-   **Features**:

    -   **Stage Variables**: Similar to environment variables, used to define values specific to the stage (e.g., `api_key`, backend endpoint).
    -   **Stage URLs**: Each stage has a unique URL, for example, `https://api-id.execute-api.aws-region.amazonaws.com/prod/`.

#### Proxy Integration

In AWS API Gateway, **Proxy Integration** is a feature that allows the API to pass through all HTTP requests directly to an AWS Lambda function or another HTTP endpoint without configuring each method, parameter, or mapping. It creates a streamlined and flexible setup, especially useful for microservices architectures. Followings are the key points of proxy integration with aws lambda

1. **Direct Pass-through of Requests**: API Gateway passes the entire request payload to the Lambda function, including the request's headers, query parameters, HTTP method, and body as a JSON object. Lambda receives it in a standard format, making it versatile for different types of requests.
2. **Single Lambda Handler for All Requests**: With Proxy Integration, a single Lambda function can handle all endpoints and HTTP methods in the API. This reduces the need for defining individual integrations and mappings for each API resource.
3. **Simplified Deployment**: It streamlines the process of setting up APIs because there’s no need to configure API Gateway resources like request/response templates or parameter mappings. This is especially beneficial for quickly deploying microservices.
4. **Flexible Response**: The Lambda function returns a response with headers, status codes, and body, which API Gateway then relays back to the client.
5. **Reduced Configuration**: Since Proxy Integration requires fewer manual configurations, it’s less prone to configuration errors and is generally easier to manage.

In contrast, **Non-Proxy Integration** involves more detailed configurations for each endpoint and allows for customized mapping and transformations. However, Proxy Integration is typically preferred for simpler, JSON-based APIs that don’t need intricate transformations.

#### Method Request

-   **Definition**: The **Method Request** is the initial part of the API Gateway process that handles the incoming request from the client.
-   **Purpose**: It sets up and validates client input before passing the request on to the backend integration (e.g., AWS Lambda, HTTP endpoints, or AWS services like Step Functions).
-   **Configuration Options**:
    -   `Request Parameters`: Defines expected query parameters, headers, or path variables.
    -   `Request Validation`: Allows validation rules to ensure clients send correct data (e.g., required parameters).
    -   `Authorization`: Enables access control options like AWS IAM permissions, Cognito User Pools, or custom authorizers.

#### Integration Request

-   **Definition**: The **Integration Request** defines how the **Method Request** is transformed and routed to the backend.
-   **Purpose**: It controls how API Gateway forwards requests to the backend service, including any required transformations or modifications.
-   **Configuration Options**:
    -   `Mapping Templates`: Define how to map and transform incoming request data to match the backend’s expected format.
    -   `Integration Type`: Specifies the type of backend integration, such as AWS Lambda, HTTP endpoint, AWS service (e.g., Step Functions, DynamoDB).
    -   `Request Parameters`: Additional parameters or headers to pass along to the backend if required.

#### Integration Response

-   **Definition**: The **Integration Response** handles the response from the backend service before passing it back to the client.
-   **Purpose**: It controls the format and transformation of the backend response, including error handling and data formatting.
-   **Configuration Options**:
    -   `Mapping Templates`: Define transformations to convert backend responses into the desired format.
    -   `Error Handling`: Specifies conditions (like status codes) to catch errors from the backend and map them to standard responses.
    -   `Headers and Parameters`: Adds or modifies headers or parameters before sending them back to the client.

#### Method Response

-   **Definition**: The **Method Response** is the final step that defines the structure and format of the response that API Gateway sends to the client.
-   **Purpose**: It sets up how the API Gateway should format the response for clients, including defining which HTTP status codes, headers, and data formats are returned.
-   **Configuration Options**:
    -   `Response Models`: Defines a schema for different HTTP status codes and responses, ensuring predictable response formats.
    -   `Status Codes`: Specifies which status codes the client can expect (e.g., 200 for success, 400 for client errors).
    -   `Headers and Parameters`: Defines response headers available to the client, like `Content-Type` or custom headers.

#### Mapping Template

In AWS API Gateway, **Mapping Templates** are used to transform incoming requests before they reach the backend and to modify backend responses before they reach the client. This transformation capability is particularly useful when integrating API Gateway with other AWS services (like AWS Lambda) or external APIs, allowing you to map data formats, handle transformations, and enforce data contracts.

-   **Key Features of Mapping Templates**

    1. `Request Transformation`:

        - You can configure mapping templates to modify or structure the data that comes from clients before sending it to the backend.
        - For instance, if a client sends data in a certain JSON format, you can transform it into another format that your backend expects (like XML or another JSON structure).
        - Mapping templates use **Velocity Template Language (VTL)**, which provides a set of pre-defined objects and functions to handle conditional logic, loops, and data transformation.

    2. `Response Transformation`:

        - Mapping templates can also be applied to transform the responses from the backend before they are returned to the client.
        - This is useful if your backend provides data in a certain format, and you need to restructure or filter the data for the client.

    3. `Content-Type Handling`:

        - Mapping templates are associated with **content types**. You can create different templates based on content types like `application/json` or `application/xml`, allowing you to support multiple client formats.
        - API Gateway then selects the appropriate mapping template based on the content type specified in the client’s request.

    4. `Example Use Cases`:
        - **Path and Query Parameter Mapping**: Transform parameters from a request path or query string into a request body format expected by the backend.
        - **Error Handling**: Modify error messages from the backend to make them more meaningful to the client by converting error codes or adding context.
        - **Data Enrichment**: Enrich requests with additional data, such as injecting metadata or headers required by the backend, without requiring the client to provide them.

-   **Example of a Simple Mapping Template**

    -   Suppose you receive a JSON request like this from a client:

        ```json
        {
            "username": "john_doe",
            "age": 30
        }
        ```

    -   If your backend expects the request in this format:

        ```json
        {
            "user": {
                "name": "john_doe",
                "age": 30
            }
        }
        ```

    -   You could create a mapping template like:

        ```vtl
        {
        "user": {
            "name": "$input.path('$.username')",
            "age": "$input.path('$.age')"
        }
        }
        ```

#### Terms & Concepts:

-   **API**: An API (Application Programming Interface) is a set of rules and protocols that allows different software applications to communicate with each other. In the context of AWS API Gateway, an API is a collection of resources and methods that can be accessed through a unique endpoint URL.
-   **Endpoint**: An endpoint is a URL that represents the location of an API or a specific resource within an API. It typically includes the base URL of the API, the resource path, and any query parameters or request headers that are needed to access the resource.
-   **Integration**: An integration is a way to connect an API Gateway method to a back-end service, such as an AWS Lambda function, an Amazon EC2 instance, or a third-party service. API Gateway supports multiple types of integrations, such as Lambda, HTTP, and WebSocket.
-   **Authorization**: Authorization is the process of controlling access to an API by requiring clients to provide valid credentials, such as an API key or an OAuth token. API Gateway supports several types of authorization, including IAM, Lambda, and custom authorizers.
-   **Throttling**: Throttling is the process of limiting the rate at which API clients can make requests to an API. API Gateway supports several types of throttling, including rate limiting and burst limiting, to prevent overloading back-end services or unauthorized access.
-   **API proxying**: It, also known as API gateway or API proxy, is a technique used to route requests from clients to backend services through an intermediary server, known as the proxy or gateway. It acts as an intermediary between the client and the actual API endpoint, providing various benefits such as security, scalability, and flexibility. Here's how API proxying works:
    -   `Routing`: The API proxy receives requests from clients and forwards them to the appropriate backend service based on predefined routing rules. These rules can be configured to direct requests based on paths, headers, or other criteria.
    -   `Security`: API proxies often implement security measures such as authentication, authorization, and rate limiting to protect backend services from unauthorized access or abuse. They can handle tasks like API key management, OAuth integration, and encryption of sensitive data.
    -   `Monitoring and Analytics`: API proxies typically offer monitoring and analytics capabilities to track the usage and performance of APIs. They can collect metrics such as request/response times, error rates, and traffic volume, providing valuable insights for troubleshooting and optimization.
    -   `Caching`: Proxies may cache responses from backend services to improve performance and reduce latency. By caching frequently accessed data, they can serve subsequent requests without hitting the backend, resulting in faster response times and reduced server load.
    -   `Transformation`: API proxies can perform data transformation and manipulation on requests and responses. They may modify headers, transform payloads between different data formats (e.g., JSON to XML), or add/remove elements from the request or response body.
    -   `Load Balancing`: In cases where multiple backend services are available to handle requests, API proxies can perform load balancing to distribute traffic evenly across the servers. This ensures optimal resource utilization and prevents overloading of individual servers.

<details open><summary style="font-size:20px;color:Tomato">RESTful APIs:</summary>

RESTful APIs in AWS API Gateway allow you to build, deploy, and manage RESTful APIs at scale. They adhere to the principles of REST (Representational State Transfer) architecture.

-   `Resource-Based Architecture`: RESTful APIs in AWS API Gateway follow a resource-based architecture where resources (e.g., objects, data) are exposed as endpoints (e.g., URLs) and support standard CRUD operations (Create, Read, Update, Delete) on these resources.
-   `HTTP Methods`: You can define HTTP methods (e.g., GET, POST, PUT, DELETE) for each resource, allowing clients to interact with the API through these methods.
-   `Integration`: RESTful APIs can integrate with backend services such as AWS Lambda functions, AWS Elastic Beanstalk applications, or HTTP endpoints. Integration options include Lambda functions, HTTP endpoints, AWS services, and AWS Lambda Proxy integration.
-   `Security`: API Gateway provides features like AWS IAM authorization, resource policies, and usage plans to secure and control access to your RESTful APIs. You can configure API keys, IAM roles, and resource policies for authentication and authorization.
-   `Monitoring and Analytics`: You can monitor API usage, performance metrics, and logs using Amazon CloudWatch and Amazon API Gateway's built-in logging and monitoring features. API Gateway provides detailed metrics, access logs, and execution logs for monitoring and troubleshooting.
-   `Use Cases`: RESTful APIs are suitable for building web services, microservices, and mobile backends where resources need to be exposed and accessed via standard HTTP methods. They are ideal for building CRUD-based applications and adhering to REST architectural principles.

#### RESTful APIs Features:

-   `Protocol Support`:
    -   REST APIs provide comprehensive support for building RESTful APIs according to the principles of Representational State Transfer (REST).
    -   They support HTTP/1.1 and HTTPS protocols.
-   `Custom Domain Names`:
    -   REST APIs support custom domain names, allowing you to provide a branded API endpoint with your own domain name.
    -   You can configure custom domain names directly within API Gateway without additional mappings.
-   `Resource-Based Routing`:
    -   REST APIs offer resource-based routing, allowing you to define hierarchical resource structures using paths and HTTP methods (e.g., GET /users, POST /users/{id}).
    -   They follow RESTful design principles, making it easy to organize and expose your API resources.
-   `Integration Types`:
    -   REST APIs support a variety of integration types, including Lambda functions, HTTP endpoints, AWS services, and AWS Step Functions.
    -   You can choose the integration type that best fits your use case, allowing you to integrate with various backend systems and services.
-   `API Keys and IAM Roles`:
    -   REST APIs support API keys and AWS Identity and Access Management (IAM) roles for controlling access to your APIs.
    -   You can use API keys to throttle and monitor API usage, and IAM roles to grant fine-grained access permissions to API resources.

#### RESTful APIs Limitations:

While REST APIs in AWS API Gateway offer a wide range of features for building RESTful APIs, they also have some limitations to consider. Here are some of the key limitations of REST APIs in AWS API Gateway:

-   `Cold Start Latency`: Like other serverless architectures, REST APIs using Lambda functions may experience cold start latency, where the initial invocation of a function takes longer due to resource provisioning. This latency can impact the responsiveness of the API.
-   `Integration Limits`: REST APIs have integration limits, such as a maximum of 30 integration responses per method, a maximum of 10 authorizers per method, and a maximum payload size of 10 MB for request and response bodies. These limits may impact the complexity and scalability of your API design.
-   `Rate Limiting Constraints`: While API Gateway supports rate limiting for controlling access to APIs, there are limitations on the granularity of rate limiting configurations. For example, you cannot specify rate limits based on specific API keys or client IPs, and the default rate limit is applied globally to all clients.
-   `API Gateway Throttling`: API Gateway imposes throttling limits on API requests to prevent abuse and ensure system stability. While throttling is necessary for protecting backend resources, it can lead to temporary service interruptions if request rates exceed the configured limits.
-   `Payload Transformations`: API Gateway supports payload transformations for modifying request and response payloads using mapping templates. However, these transformations are limited in functionality compared to dedicated transformation services, and complex transformations may require additional processing.
-   `CORS Configuration`: Cross-Origin Resource Sharing (CORS) configuration in API Gateway has limitations, such as a maximum of 30 CORS configurations per API and restrictions on wildcard (\*) usage. This may impact the flexibility of CORS policies for enabling cross-origin requests.
-   `Monitoring and Logging Limits`: While API Gateway provides monitoring and logging capabilities for tracking API usage and performance, there are limits on the volume of logs and metrics that can be stored and retained. This may require additional monitoring solutions for long-term data retention and analysis.
-   `Integration Timeout`: API Gateway imposes integration timeouts for API requests to backend services. If the backend service does not respond within the specified timeout period, the request may fail with a timeout error. Configuring appropriate timeout values is important for handling varying backend response times.
-   `Integration Response Mapping`: Mapping integration responses to HTTP status codes and headers in API Gateway can be complex, especially for APIs with multiple integration responses. Managing response mappings and error handling logic may require careful configuration and testing.

</details>

<details open><summary style="font-size:20px;color:Tomato">HTTP APIs:</summary>

HTTP APIs in AWS API Gateway offer a more lightweight and cost-effective alternative to traditional RESTful APIs. They are optimized for serverless workloads and provide features tailored to modern web applications.

-   `Simplified Configuration`: HTTP APIs in AWS API Gateway offer a more lightweight and cost-effective alternative to traditional RESTful APIs. They provide simplified configuration options for defining routes, methods, and integrations, making it easier to build and manage APIs.
-   `Built-in CORS Support`: HTTP APIs provide built-in Cross-Origin Resource Sharing (CORS) support, allowing you to define CORS policies to control access from web browsers. CORS settings can be configured at the API level or the route level.
-   `JWT Authorizers`: HTTP APIs support JWT (JSON Web Token) authorizers for authentication and authorization. You can use JWT tokens to authenticate and authorize requests, simplifying the implementation of authentication in serverless applications.
-   `Payload Validation`: HTTP APIs support payload validation, allowing you to validate request and response payloads against JSON schemas or OpenAPI definitions. You can define request and response models and validate incoming and outgoing payloads against these models.
-   `Cost-Effective`: HTTP APIs offer a lower cost structure compared to RESTful APIs, making them suitable for serverless applications with high traffic volume. They provide a cost-effective option for building modern web applications and serverless microservices.
-   `Use Cases`: HTTP APIs are well-suited for building modern web applications, single-page applications (SPAs), and serverless microservices where simplicity, scalability, and cost-effectiveness are priorities. They are ideal for scenarios where traditional RESTful APIs may be too complex or costly to manage.

#### HTTP APIs Features:

-   `Protocol Support`:
    -   HTTP APIs are designed to provide a low-latency and low-cost option for building HTTP-based APIs.
    -   They support HTTP/1.1 and HTTP/2 protocols.
-   `API Mapping`:
    -   HTTP APIs offer simplified API mapping, allowing you to map multiple custom domain names to a single API endpoint.
    -   They do not support custom domain names directly; instead, you configure API mappings using API Gateway stages.
-   `WebSocket Support`:
    -   HTTP APIs support WebSocket connections, making it easy to build real-time, bidirectional communication applications such as chat apps, gaming platforms, and IoT applications.
    -   They provide native WebSocket support, allowing you to handle WebSocket connections without the need for additional services.
-   `Lambda Proxy Integration`:
    -   HTTP APIs support Lambda proxy integration, where the integration request and response payloads are passed directly to and from Lambda functions.
    -   This simplifies the integration setup and enables you to build serverless applications with Lambda functions as the backend.
-   `OAuth 2.0 and JWT Authorizers`:

    -   HTTP APIs support OAuth 2.0 and JSON Web Token (JWT) authorizers for authenticating and authorizing API requests.
    -   You can use OAuth 2.0 or JWT tokens to protect your APIs and control access based on user identities or custom claims.

#### HTTP APIs Limitations:

-   `Limited Protocol Support`: HTTP APIs support HTTP/1.1 and HTTP/2 protocols but do not support older protocols such as HTTP/1.0. This may limit compatibility with some legacy systems or clients.
-   `Limited Integration Options`: HTTP APIs have limited integration options compared to REST APIs. They primarily support Lambda functions and HTTP endpoints as backend integrations. While Lambda proxy integration is convenient for serverless architectures, it may not be suitable for complex integration scenarios.
-   `Limited Deployment Options`: HTTP APIs are only available in the API Gateway version 2.0, which means they do not support the previous version 1.0 deployment options. This may impact migration efforts or compatibility with existing API Gateway features.
-   `Limited Customization`: HTTP APIs offer fewer customization options compared to REST APIs. For example, they do not support custom domain names directly; instead, you must use API mappings to map custom domain names to API endpoints.
-   `No Stage Variables`: HTTP APIs do not support stage variables, which are commonly used in REST APIs to define environment-specific configuration values. This may require alternative approaches for managing environment-specific settings.
-   `No Resource Policies`: HTTP APIs do not support resource policies, which are used in REST APIs to control access to API resources based on IP address or VPC endpoint. This may limit security controls for certain use cases.
-   `Limited Monitoring and Logging`: HTTP APIs offer basic monitoring and logging capabilities compared to REST APIs. While you can enable logging and monitoring for HTTP APIs, the available metrics and logs may be limited compared to REST APIs.
-   `Limited API Gateway Features`: Some advanced API Gateway features, such as AWS WAF integration, caching, and request/response transformations, are not fully supported or may have limitations when using HTTP APIs.

</details>

<details open><summary style="font-size:20px;color:Tomato">WebSocket APIs:</summary>

WebSocket APIs in AWS API Gateway enable real-time, bidirectional communication between clients and servers over a single TCP connection. They provide full-duplex communication channels.

-   `Real-time Communication`: WebSocket APIs support low-latency, real-time communication between clients and servers, making them ideal for applications requiring real-time updates and notifications.
-   `Persistent Connection`: WebSocket APIs establish a persistent connection between clients and servers, allowing both parties to send messages to each other asynchronously.
-   `Serverless Integration`: You can integrate WebSocket APIs with AWS Lambda functions to handle WebSocket messages and execute business logic in a serverless environment.
-   `Security`: WebSocket APIs support authentication and authorization mechanisms to secure connections and control access to resources.
-   `Scalability`: AWS API Gateway automatically scales WebSocket APIs to handle high volumes of concurrent connections and messages.
-   `Use Cases`: WebSocket APIs are commonly used in applications such as chat applications, multiplayer games, real-time collaboration tools, and financial trading platforms.
</details>

<details open><summary style="font-size:20px;color:#FF1493">Use Cases of API Gateway</summary>

AWS API Gateway has several practical use cases in data engineering, especially in creating and managing APIs that interface with various data pipelines and processes. Here are some common use cases:

1. **Exposing Data Processing Pipelines as APIs**

    - **Use Case**: Create APIs for external or internal users to submit data for processing.
    - **Example**: An API that receives data from clients and triggers an AWS Lambda function, which preprocesses and loads the data into AWS S3, DynamoDB, or RDS. This can be used in ETL pipelines.

2. **Real-Time Data Ingestion for Streaming Pipelines**

    - **Use Case**: Provide a scalable, low-latency endpoint for ingesting streaming data.
    - **Example**: API Gateway can front Amazon Kinesis to ingest real-time event data, such as IoT sensor data, which can then be processed and analyzed in real time.

3. **Orchestrating Data Jobs via API**

    - **Use Case**: Expose APIs to trigger specific data engineering jobs or workflows.
    - **Example**: Use API Gateway to trigger AWS Step Functions, which orchestrate complex ETL pipelines involving services like Lambda, Glue, or EMR for data processing and transformations.

4. **Data Enrichment as a Service**

    - **Use Case**: Provide an API to enhance datasets with additional data from external or internal sources.
    - **Example**: An API Gateway that fronts a Lambda function to enrich customer records by calling external APIs (e.g., validating address details or credit scores).

5. **Secure Data Access for Analytics**

    - **Use Case**: Securely expose APIs to provide controlled access to datasets stored in S3, DynamoDB, or RDS.
    - **Example**: An internal API that returns filtered data from S3 buckets or a database (PostgreSQL/MySQL) based on user roles or other security constraints using AWS Identity and Access Management (IAM) and API Gateway custom authorizers.

6. **Serverless Microservices for Data Transformation**

    - **Use Case**: Enable microservices architecture for data transformation logic.
    - **Example**: API Gateway can be used to invoke Lambda functions that handle data transformations (e.g., format conversion, aggregations) before persisting the data into a data lake or a data warehouse.

7. **REST API for Querying and Fetching Data**

    - **Use Case**: Create APIs for querying datasets for downstream applications.
    - **Example**: Use API Gateway to expose a REST API for querying a dataset stored in Amazon Redshift or DynamoDB, enabling data retrieval for dashboards or analytics apps.

8. **Data Validation and Preprocessing Layer**

    - **Use Case**: Validate incoming data before ingestion into the data pipeline.
    - **Example**: API Gateway can expose an API that receives raw data, performs basic validation (via Lambda), and then forwards the valid data to S3 or a Kinesis stream.

9. **Monitoring and Logging of Data APIs**

    - **Use Case**: Implement monitoring and logging for data ingestion and processing APIs.
    - **Example**: API Gateway can be used with AWS CloudWatch to monitor API performance, logging, and error tracking for APIs that ingest and process data in real-time systems.

10. **API Gateway as Proxy for Third-Party Data Sources**

    - **Use Case**: Use API Gateway as a proxy to fetch or send data to third-party APIs.
    - **Example**: API Gateway can proxy requests to external services (e.g., payment processors, data providers) and integrate their data into internal pipelines.

11. **Public Data APIs for External Partners or Customers**

    - **Use Case**: Expose specific datasets or aggregated data as APIs for external customers or partners.
    - **Example**: A data product that exposes aggregated reports or analytics data via API Gateway to allow external partners to query specific metrics or KPIs.

12. **Rate Limiting and Throttling for Ingestion APIs**

    - **Use Case**: Control the flow of data ingestion by applying rate limits or throttling.
    - **Example**: API Gateway allows you to set up throttling policies to control the number of requests per second to prevent overloading downstream services like Kinesis, S3, or RDS.

</details>

#### Endpoints and Custom Domain Names:

API Gateway provides default **API endpoints** but also allows you to associate your API with a **custom domain name**.

-   **Features**:
    -   **Regional Endpoints**: Serve requests from specific AWS regions.
    -   **Edge-Optimized Endpoints**: Uses CloudFront to serve requests to globally distributed users.
    -   **Custom Domain**: Map your custom domain name (e.g., `api.yourdomain.com`) to your API Gateway endpoint.

#### Integration Types:

API Gateway allows you to integrate the frontend API with various backend services via different integration types:

-   **Lambda Integration**: Direct integration with AWS Lambda functions, allowing you to run serverless functions as API endpoints.
-   **HTTP/HTTP_PROXY Integration**: API Gateway can route requests to HTTP-based backends such as web servers or third-party APIs.
-   **AWS Service Integration**: Integrate with other AWS services like DynamoDB, SNS, or SQS directly, without requiring Lambda.

#### Mapping Templates (Velocity Templates):

**Mapping templates** are used to transform incoming requests before passing them to the backend or to transform the responses before sending them back to the client. This is done using the **Velocity Template Language (VTL)**.

-   **Features**:
    -   Modify the request format (e.g., JSON to XML).
    -   Map query parameters, headers, and body to backend-specific formats.
    -   Extract and modify response data.

#### Authorization:

API Gateway supports several types of authorization to secure access to your APIs:

-   **IAM Roles**: Use AWS IAM roles to authorize access to your API based on user identity and policies.
-   **Cognito User Pools**: Use Amazon Cognito to control access via OAuth2 or JWT-based token authentication.
-   **Lambda Authorizer**: Use a custom Lambda function to authenticate and authorize requests based on custom logic (e.g., checking API keys, tokens).
-   **API Keys**: Restrict access to your API using **API keys**, which are passed in the request headers.

#### Caching:

API Gateway provides **caching** at the stage level to reduce the latency of your API and improve performance.

-   **Features**:
    -   Store responses from your backend services in an API Gateway cache.
    -   Specify TTL (Time to Live) for cache data.
    -   Cache data per method and per request, based on query strings or headers.

#### Monitoring and Metrics:

API Gateway integrates with **Amazon CloudWatch** for monitoring, logging, and alerting, giving insights into API performance and usage.

-   **CloudWatch Metrics**: API Gateway automatically publishes metrics such as **latency**, **error rates**, **cache hits/misses**, and **throttling** counts to CloudWatch.
-   **CloudWatch Logs**: API Gateway can be configured to log request/response data and error details for debugging.

#### Throttling and Rate Limiting:

API Gateway allows you to control the rate of incoming requests to prevent overloading your backend services.

-   **Default Throttling**: Set default limits for request rates and burst limits for your API.
-   **Usage Plans**: Use API keys with usage plans to apply throttling rules and quota limits to individual users or applications.

#### API Gateway VPC Link:

**VPC Link** allows API Gateway to integrate with private resources inside a **VPC (Virtual Private Cloud)**, such as internal web services or databases.

-   **Features**:
    -   **Private Integration**: Allows API Gateway to access services running in a private VPC without exposing them to the public internet.
    -   Ideal for accessing backend services like EC2, ECS, or load balancers that are hosted in a private subnet.

#### Mock Integration:

**Mock Integration** is used to return static responses without sending requests to any backend. It’s useful for testing and prototyping.

-   **Features**:
    -   Simulate API responses.
    -   Set up static responses based on incoming requests.
    -   No backend services involved.

#### Deployment:

API Gateway provides the ability to **deploy** APIs to various stages (e.g., dev, test, prod) and manage different versions of your APIs.

-   **Features**:
    -   **Deployment** creates a snapshot of your API configuration and methods at a specific point in time.
    -   You can **roll back** to previous versions of the API if needed.
    -   Each stage has a unique URL for accessing the deployed API.

#### Cross-Origin Resource Sharing (CORS):

**CORS** is a security feature implemented by browsers to restrict web applications from making requests to a domain different from the one that served the web page.

-   **Features**:
    -   API Gateway supports **CORS** to allow restricted resources to be accessed on a domain different from the origin.
    -   You can configure **CORS** settings to control which origins and methods are allowed for your API.

#### OpenAPI (Swagger) Support:

API Gateway supports the **OpenAPI Specification (formerly known as Swagger)** for defining your API structure.

-   **Features**:
    -   Import and export your API definitions using OpenAPI/Swagger files.
    -   Simplifies API development by providing a standard, machine-readable format.
    -   Use OpenAPI definitions for documentation or collaboration purposes.

#### API Gateway Policies:

API Gateway supports **resource policies** that allow you to control access to your API at the **resource level**.

-   **Features**:
    -   You can restrict access to specific IP ranges, VPCs, or AWS accounts.
    -   Resource policies are useful for implementing fine-grained access control to APIs.

#### SDK Generation:

API Gateway can automatically generate **SDKs (Software Development Kits)** for various programming languages (e.g., JavaScript, iOS, Android) based on your API definitions.

-   **Features**:
    -   Simplifies the integration of APIs into client applications.
    -   Generates client-side code that can handle API calls, including authentication and request/response handling.

#### Error Handling:

API Gateway allows you to define custom error responses, enabling better error handling in your API.

-   **Features**:
    -   You can set up custom response templates to format error messages.
    -   Define specific HTTP status codes based on the response from the backend (e.g., 4xx for client errors, 5xx for server errors).

#### Access Logs:

API Gateway provides **detailed access logs** to monitor API usage and analyze performance.

-   **Features**:
    -   Logs include detailed information such as request timestamps, IP addresses, request/response payloads, and latency.
    -   Access logs can be stored in CloudWatch Logs for long-term analysis.

AWS API Gateway provides a range of features and capabilities for creating and managing APIs, making it a powerful tool for building modern, scalable applications. Understanding these key concepts and terms is essential for effectively using and configuring the service.

</details>

---

<details><summary style="font-size:25px;color:Orange">DynamoDB</summary>

-   [Be A Better Dev: AWS DynamoDB Guides](https://www.youtube.com/playlist?list=PL9nWRykSBSFi5QD8ssI0W5odL9S0309E2)
-   [AWS DynamoDB](https://www.youtube.com/playlist?list=PLJo-rJlep0EApPrKspmHybxvbZsXruhzR)
-   [boto3.DynamoDB Dcos](https://boto3.amazonaws.com/v1/documentation/api/latest/reference/services/dynamodb.html)

AWS DynamoDB is a fully managed **Key-Value Stores** NoSQL database service provided by Amazon Web Services (AWS). It is designed to handle large volumes of data with low latency and high performance, offering automatic scaling, high availability, and robust security features. DynamoDB is particularly well-suited for applications that require consistent, single-digit millisecond response times at any scale.

-   **Key-Value Stores**: Key-Value Store is a type of NoSQL database that uses a simple key-value pair mechanism to store data. It is one of the most straightforward types of databases, where each unique key is associated with a value, which can be any type of data, from simple strings to complex objects like JSON, BLOBs, or serialized objects.

    -   `Data Model`: Simple key-value pairs; values can be binary blobs or strings.

        -   `Keys`: Unique identifiers used to access the associated values. Keys are usually simple strings.
        -   `Values`: The data associated with the keys, which can be any datatype.
        -   `Schema-less`: No fixed schema, allowing for flexible and dynamic data storage.

    -   `High Performance`: Optimized for fast read and write operations, often achieving low latency due to the simplicity of key-value access patterns.
    -   `Scalability`: Designed to scale horizontally, making it easy to distribute data across multiple servers.

    -   `Strengths`:

        -   Extremely fast and scalable for read and write operations.
        -   Ideal for caching, session management, and real-time analytics.
        -   Well-suited for high-throughput applications.

    -   `Weaknesses`:
        -   Limited query capabilities (no complex queries or joins).
        -   May not support data types beyond strings and binary.

#### Terms & Concepts

-   `Schema`: The term "schema" refers to the structure and organization of the data stored in your DynamoDB tables. Unlike traditional relational databases, DynamoDB is a NoSQL database that does not require a fixed schema defined ahead of time. Instead, each item (record) within a DynamoDB table can have its own attributes, and different items within the same table can have different attributes.
-   `Tables`: A DynamoDB table is a collection of items that share the same primary key. Tables are used to store and retrieve data in a scalable and durable manner.
-   `Items`: An item is a collection of attributes that is uniquely identifiable by a primary key. In a DynamoDB table, items are the individual records that are stored.
-   `Atributes`: Attributes are the fundamental data elements stored in a table. In DynamoDB, attributes are stored in a flexible schema, meaning that you do not need to define a fixed schema for your table beforehand. Instead, you can simply create a table and add or remove attributes as needed when you insert or update items.

    -   Each attribute is made up of a name-value pair.
    -   Attributes can also be used as primary or sort keys to enable fast and efficient queries.
    -   Can also define attribute-level access controls.

-   `Primary Key`: DynamoDB tables are organized around a primary key composed of one or two attributes, which uniquely identifies the item in the table. There are two types of primary keys: partition key and composite key.

    -   `Partition Key`: Also known as a hash key, this is a simple primary key composed of a single attribute. DynamoDB uses the partition key value as input to an internal hash function to determine the partition in which an item is stored.
    -   `Composite Key`: Also known as a partition key and sort key, this is a primary key composed of two attributes.
        -   `Partition Key`: is used to determine the partition in which an item is stored.
        -   `Sort Key`: is used to sort items within the partition. It's also known as Range key.

-   `Secondary Index`: Secondary Index in Amazon DynamoDB is a separate data structure that allows you to query and retrieve data from a DynamoDB table using attributes other than the primary key. There are two types of secondary indexes: global secondary index and local secondary index.

    -   `Global Secondary Index`: A Global Secondary Index is an independent data structure that has its own partition key and sort key. It does not require to be created at the same time as the table. GSIs index all items in the table by default, provided the indexed attributes (partition key and/or sort key) exist. If an item lacks the attributes defined in the GSI key schema, it is excluded from the index. It enables querying based on attributes not included in the main table's primary key. Here's how it works:

        -   `Data Copying`: DynamoDB automatically copies data from the main table to the GSI. The copied data includes the primary key attributes as well as projected attributes.
        -   `Querying`: You can query a GSI using the Query operation, providing the GSI's partition key and optional sort key values. The query results are limited to the data present in the GSI.
        -   `Projection`: GSIs also support projected attributes, allowing you to optimize query performance by including frequently accessed attributes.
        -   `Read and Write Capacity`: GSIs have their own provisioned read and write capacity settings, allowing you to allocate resources specifically for index operations.
        -   `Consistency`: GSIs support both eventually consistent and strongly consistent reads.

    -   `Sparse Index`: A Sparse Index is a type of index (usually a GSI) that includes only a subset of the items in the table. This happens because only items with the attributes defined in the index key schema are indexed.

        -   Unlike a regular GSI, a Sparse Index intentionally excludes items that do not have the required attributes.
        -   The sparseness is a result of using a design where the indexed attributes only exist on certain items.
        -   Designed to filter out irrelevant data and optimize queries for specific subsets of data. For example, indexing only "high-priority" orders in an orders table.

    -   `Local Secondary Index`: A Local Secondary Index is an index that shares the same partition key as the base table but has a different sort key. It requires to be created at the same time as the table and can be used to query and retrieve data in a specific order based on the alternate sort key. Here's how it works:
        -   `Data Copying`: DynamoDB automatically copies data from the main table to the LSI, using the same partition key value as the main table but with a different sort key.
        -   `Querying`: You can query an LSI using the Query operation. The partition key value is taken from the main table's partition, but you can specify a range of sort key values for your query.
        -   `Projection`: Like GSIs, LSIs allow you to specify projected attributes that are included in the index, avoiding the need to access the main table for those attributes during queries.
        -   `Consistency`: LSIs support both eventually consistent and strongly consistent reads.

#### DynamoDB Throughput

-   `Throughput`: Throughput is a mechanism to specify the reading and writing capacity of the DynamoDB table. When you create a table in DynamoDB, you can specify the desired throughput capacity in terms of `RCU`s and `WCU`s. These provisioned throughput values determine how much capacity is allocated to your table, allowing you to handle the expected read and write loads. Keep in mind that DynamoDB's pricing is based on the provisioned throughput capacity you specify. Throughput is measured in `Capacity Units`. There are two types of capacity units:

    -   `Read Capacity Unit (RCUs)`: A read capacity unit is the amount of read throughput that is required to read one item per second from a DynamoDB table. One RCU represents the capacity to perform one strongly consistent read per second of an item up to 4 KB in size, or two eventually consistent reads per second of an item up to 4 KB in size. If your items are larger than 4 KB, you will need to provision additional RCUs to handle the extra size.
    -   `Write Capacity Unit (WCUs)`: A write capacity unit is the amount of write throughput that is required to write one item per second to a DynamoDB table. One WCU represents the capacity to perform one write per second for an item up to 1 KB in size. Like with RCUs, if your items are larger, you'll need to provision additional WCUs.

-   `Provisioned Throughput`: Provisioned throughput is the maximum amount of read and write capacity that can be specified for a DynamoDB table. It determines the number of RCUs and WCUs that are available to the table.
-   `Conditional Writes`: Conditional writes are a way to update or delete an item in a DynamoDB table based on a condition. This allows you to ensure that the item being modified meets certain criteria before making the change.

-   `Throttling`: Throttling in DynamoDB refers to the mechanism that limits the number of requests that can be made to the service within a specified period. DynamoDB throttling occurs when a table or partition is receiving more read or write requests than it can handle. DynamoDB limits the number of read and write operations per second for each table partition based on the provisioned throughput capacity. If the provisioned capacity is exceeded, the requests are throttled, and an error response with an HTTP 400 status code is returned to the caller. DynamoDB provides two types of throttling:

    -   `Provisioned throughput throttling`: This type of throttling occurs when you have set up provisioned throughput capacity on a DynamoDB table, and the request rate exceeds the capacity you have provisioned. In this case, DynamoDB returns a ProvisionedThroughputExceededException error.
    -   `On-demand capacity throttling`: This type of throttling occurs when you use on-demand capacity mode for your DynamoDB table, and the request rate exceeds the maximum burst capacity. In this case, DynamoDB returns a RequestLimitExceeded error.
    -   To avoid throttling in DynamoDB, you can monitor the provisioned throughput capacity of your tables and increase it if necessary. You can also use best practices such as partitioning your data to evenly distribute read and write requests across the table partitions. Additionally, you can implement exponential backoff retries in your application code to automatically handle throttling errors and reduce the request rate.

When using Amazon DynamoDB, you can choose between **Provisioned Capacity** and **On-Demand Capacity** modes to manage the read and write throughput of your tables. Here's a detailed comparison:

-   **Provisioned Capacity Mode**:

    -   You predefine the number of **Read Capacity Units (RCUs)** and **Write Capacity Units (WCUs)** for your table.
    -   The table can handle a fixed number of reads and writes per second based on the allocated capacity.
    -   `Predictable Workloads`: Ideal for applications with steady or predictable traffic patterns where you can estimate throughput needs.
    -   `Auto Scaling Option`: You can enable Auto Scaling to adjust capacity automatically in response to traffic changes.
    -   `Throttling`: If your workload exceeds the provisioned throughput, requests get throttled unless you scale up.
    -   `Cost`: You pay for the provisioned RCUs and WCUs, regardless of actual usage.
    -   `Billing:`: Based on the number of provisioned RCUs and WCUs, even if the capacity is underutilized.

-   **On-Demand Capacity Mode**:

    -   No need to specify RCUs or WCUs upfront. DynamoDB automatically adjusts the table's capacity to handle any amount of traffic.
    -   You are billed only for the actual reads and writes performed.
    -   `Unpredictable Workloads`: Best for applications with spiky or unpredictable traffic patterns.
    -   `No Throttling`: Automatically scales to meet the workload.
    -   `Simplicity`: No capacity planning is needed.
    -   Applications with unknown or fluctuating workloads (e.g., gaming leaderboards, IoT applications, ad-hoc analytics).

#### DynamoDB Stream

A DynamoDB Stream is a feature provided by Amazon DynamoDB. A DynamoDB Stream trigger events (INSERTS, UPDATES, DELETES) capturing changes (inserts, updates, deletes) made to items in a DynamoDB table and then provides a time-ordered sequence of these changes. Streams enable real-time processing and analysis of data changes, making them useful for various scenarios such as data replication, maintaining secondary indexes, triggering AWS Lambda functions, and more. Here are the key aspects of DynamoDB Streams:

-   `Stream Enabled Table`: To use DynamoDB Streams, you need to enable streams on a DynamoDB table. When streams are enabled, DynamoDB keeps track of changes to the items in that table.
-   `Stream Records`: Each change made to a DynamoDB item generates a stream record. A stream record contains information about the change, including the type of operation (insert, modify, delete), the item's data before the change, and the item's data after the change.
-   `Time-Ordered Sequence`: The stream records are stored in a time-ordered sequence. This means that changes to the table's items are captured in the order they occur, allowing downstream applications to process the changes in the same order.
-   `Consumers`: DynamoDB Streams allow you to set up consumers that read and process the stream records. One common use case is to trigger AWS Lambda functions in response to changes in the stream. For example, you can configure a Lambda function to be invoked whenever a new item is inserted into the table.
-   `Data Synchronization and Backup`: Streams can be used for data replication and synchronization between DynamoDB tables or other data stores. They can also serve as a backup mechanism by capturing all changes to your data.
-   `Real-time Analytics`: Streams enable real-time processing and analysis of data changes. You can use them to generate real-time insights and metrics based on the changes in your DynamoDB data.
-   `Cross-Region Replication`: DynamoDB Streams can be used to replicate data changes across different AWS regions, helping you maintain data availability and disaster recovery capabilities.

#### DynamoDB Transactions

DynamoDB Transactions are a feature introduced by Amazon DynamoDB to provide atomicity, consistency, isolation, and durability (ACID) properties for multiple operations within a single transactional context. This ensures that a group of operations either complete successfully or have no effect at all, maintaining data integrity and consistency even in complex scenarios involving multiple items or tables.DynamoDB Transactions are particularly useful in scenarios where data consistency across multiple items or tables is crucial. They are beneficial for applications that require strong guarantees about data integrity, such as financial applications, e-commerce platforms, and more. Here are the key aspects of DynamoDB Transactions:

-   `Atomicity`: All the operations within a transaction are treated as a single unit of work. If any part of the transaction fails, all changes made by the transaction are rolled back, and the data remains unchanged.
-   `Consistency`: DynamoDB Transactions maintain the consistency of the data. This means that the data is transitioned from one valid state to another valid state. All data involved in a transaction adheres to the defined business rules and constraints.
-   `Isolation`: Transactions are isolated from each other, meaning that the changes made by one transaction are not visible to other transactions until the transaction is committed. This ensures that concurrent transactions do not interfere with each other's intermediate states.
-   `Durability`: Once a transaction is successfully committed, the changes are permanently stored and will not be lost, even in the event of a system failure or restart.
-   `Transactional APIs`: DynamoDB provides transactional APIs that allow you to group multiple operations (such as `put`, `update`, `delete`) into a single transaction. You can execute these operations on one or more tables in a consistent and reliable manner.
-   `Conditional Expressions`: DynamoDB Transactions can include conditional expressions to ensure that certain conditions are met before the transaction is executed. This adds an additional layer of control over the transactional behavior.
-   `Isolation Levels`: DynamoDB supports two isolation levels for transactions: Read Committed and Serializable. Read Committed ensures that the data read in a transaction is the most recent committed data, while Serializable provides a higher level of isolation by preventing other transactions from modifying the data while a transaction is in progress.

#### FACTS:

-   `Fully Managed`: AWS manages the infrastructure, scaling, and maintenance of DynamoDB, making it a serverless and highly available database service.
-   `Key-Value Store`: DynamoDB primarily operates as a key-value store. Each item in DynamoDB is uniquely identified by a primary key, consisting of one or both of the following components:

    -   `Partition Key`: Used to partition the data for distribution across multiple servers. It determines the physical location of the data.
    -   `Sort Key (optional)`: Used for range queries and to create a composite primary key.

-   `Document Support`: DynamoDB also supports a document data model, where items can be structured as nested JSON-like documents. This allows for more flexible and complex data structures.
-   `Schemaless`: DynamoDB is schemaless, meaning you can add or remove attributes from items without affecting other items in the same table. This flexibility is common in NoSQL databases.

-   **High Availability**:

    -   DynamoDB is a fully managed NoSQL database service that provides low latency and high scalability for applications that require consistent, single-digit millisecond response times. To ensure high availability, DynamoDB replicates data synchronously across three AZs in a region, ensuring that there is always a copy of the data available even if one or two AZs experience issues.
    -   If one AZ becomes unavailable, DynamoDB automatically redirects requests to one of the other two AZs where the data is available, providing uninterrupted access to the database. If two AZs become unavailable, DynamoDB continues to operate normally in the remaining AZ, and recovery processes begin to restore access to the affected AZs.
    -   Additionally, DynamoDB uses automatic scaling to ensure that it can handle varying levels of traffic without downtime. DynamoDB automatically partitions data and traffic across multiple nodes, allowing it to handle high levels of read and write requests while maintaining consistent performance.
    -   In summary, AWS DynamoDB provides high availability through `multi-AZ deployment`, `synchronous data replication`, and `automatic scaling`. These features ensure that the database remains accessible and performs consistently, even in the event of infrastructure failures or high traffic volumes.

-   **Data Durability**:

    -   `Replication`: DynamoDB replicates data across multiple Availability Zones (AZs) within a region, ensuring that if one AZ fails, data is still available from another AZ. This ensures high availability and durability of data.
    -   `Data Storage`: DynamoDB stores data in solid-state drives (SSDs), which are more reliable and durable than traditional hard disk drives (HDDs). This helps ensure that data is not lost due to hardware failures.
    -   `Automatic backups and point-in-time recovery`: DynamoDB provides automatic backups and point-in-time recovery features, which help ensure that data is recoverable in case of accidental deletion, application errors, or other types of data loss.
    -   `Redundancy`: DynamoDB maintains multiple copies of data in different locations, ensuring that data is not lost in case of hardware or network failures.
    -   `Continuous monitoring and self-healing`: DynamoDB continuously monitors the health of its resources and automatically replaces failed or degraded resources with new ones.
    -   synchronously replicates data across three facilities in an AWS Region. (99.999% garanteed uptime)

-   Optimized for performance at scale (scale out horizonlaly by adding more nodes to the cluster)
-   runs exclusively on SSDs to provide high I/O performance
-   provides provisioned table reads and writes
-   automatically partitions, reallocates and re-partitions the data and provisions additional server capacity as data or throughput changes
-   provides `Eventually Consistent` (by default) or `Strongly Consistent` option to be specified during an read operation
-   creates and maintains indexes for the primary key attributes for efficient access of data in the table
-   supports secondary indexes

    -   allows querying attributes other then the primary key attributes without impacting performance.
    -   are automatically maintained as sparse objects

-   supports cross region replication using DynamoDB streams which leverages Kinesis and provides time-ordered sequence of item-level changes and can help for lower RPO, lower RTO disaster recovery
-   Data Pipeline jobs with EMR can be used for disaster recovery with higher RPO, lower RTO requirements
-   supports triggers to allow execution of custom actions or notifications based on item-level updates

</details>

---

<details><summary style="font-size:25px;color:Orange">AWS EMR</summary>

Amazon Elastic MapReduce (EMR) is a managed big data platform on AWS that simplifies the processing and analysis of large datasets using popular open-source frameworks such as Apache Hadoop, Apache Spark, and Apache HBase. Here are some key terms and concepts associated with AWS EMR:
AWS EMR (Amazon Elastic MapReduce) is a cloud-based big data platform provided by Amazon Web Services (AWS). It simplifies the processing and analysis of large datasets by offering a managed environment for running open-source distributed computing frameworks such as Apache Hadoop, Apache Spark, Apache Hive, and Apache HBase. In simple terms, AWS EMR allows you to:
Amazon Elastic MapReduce (Amazon EMR) is a cloud big data platform designed to process and analyze vast amounts of data using frameworks like Apache Hadoop, Spark, HBase, and Presto. The key components and configurations in Amazon EMR, including **Master Node, Core Node, Task Node, Managed Scaling, Steps, Amazon EMR Studio, and Security Configurations**, are as follows:

-   **Cluster**: A cluster is a group of EC2 instances (nodes) provisioned by EMR to perform data processing tasks. EMR clusters can include master nodes, core nodes, and task nodes, depending on the configuration.

-   **Instance Type**: An instance type determines the compute, memory, and storage capacity of each node in an EMR cluster. AWS offers various instance types optimized for different workloads and use cases.

-   **Bootstrap Actions**: Bootstrap actions are scripts or commands executed on cluster nodes during cluster startup. They are used to install software packages, configure environment settings, or perform custom initialization tasks.

-   **Cluster Auto-termination**: Cluster auto-termination is a feature of EMR that automatically shuts down idle clusters after a specified period of inactivity. It helps minimize costs by ensuring that clusters are only running when needed.

#### Master Node:

The master node is the control node of an EMR cluster responsible for coordinating the execution of tasks and managing the overall cluster. It hosts the Hadoop Distributed File System (HDFS) NameNode and other cluster-level services.

-   **Role**:
    -   The **master node** coordinates the entire cluster by assigning tasks to core and task nodes, tracking their progress, and managing the cluster state.
    -   It runs key cluster management services such as Hadoop NameNode (for HDFS), YARN Resource Manager (for resource allocation), or Spark driver (for job coordination).
-   **Significance**:
    -   Without the master node, the cluster cannot function, as it orchestrates data processing and resource management.
    -   Typically, a cluster has **one master node**, but you can set up high availability with multiple master nodes in EMR versions that support this feature.
-   **Specifications**:
    -   Should have robust hardware specifications since it handles critical management processes.

#### Core Node:

Core nodes are responsible for storing and processing data in an EMR cluster. They host HDFS DataNodes and participate in data processing tasks such as MapReduce or Spark jobs.

-   **Role**:
    -   Core nodes are responsible for running processing tasks and storing data in the Hadoop Distributed File System (**HDFS**).
    -   They manage long-term data storage and perform computational tasks like executing map and reduce operations in Hadoop or Spark jobs.
-   **Significance**:
    -   Core nodes form the backbone of the EMR cluster as they handle data and process workloads simultaneously.
    -   They report back to the master node on task progress.
-   **Characteristics**:
    -   Loss of core nodes may lead to data loss unless redundancy is configured using S3 or HDFS replication.

#### Task Node:

Task nodes are optional nodes in an EMR cluster used to offload processing tasks from core nodes. They do not store data and are typically used to scale processing capacity dynamically.

-   **Role**:
    -   Task nodes perform only computational tasks without storing data in HDFS.
    -   These are optional and typically added to increase processing capacity during peak workloads.
-   **Significance**:
    -   Task nodes provide scalability and flexibility, enabling the cluster to handle larger workloads dynamically.
    -   They can be added or removed without impacting the cluster's data storage.
-   **Use Case**:
    -   Useful for one-off tasks or temporary scaling of compute capacity.

#### Managed Scaling

Managed Scaling is a feature of EMR that automatically resizes the cluster by adding or removing task nodes based on the workload and resource requirements. It helps optimize cluster utilization and cost-efficiency.

-   **Description**:
    -   Managed Scaling allows Amazon EMR to **automatically adjust the number of nodes** in a cluster based on workload demands.
-   **How It Works**:
    -   The cluster adjusts the compute capacity (adding/removing nodes) to match application needs, optimizing costs and performance.
    -   Scaling is based on CloudWatch metrics and thresholds defined by the user.
-   **Benefits**:
    -   **Cost Efficiency**: Reduces costs by scaling down resources when idle.
    -   **Performance Optimization**: Ensures sufficient capacity during peak loads.
-   **Configuration**:
    -   Enabled during cluster setup, with users specifying the minimum and maximum node limits.

#### Steps:

Steps are individual processing tasks or jobs submitted to an EMR cluster for execution. Each step typically represents a specific data processing operation, such as running a MapReduce job or executing a Spark application.

-   **Definition**:
    -   A "Step" in Amazon EMR represents a unit of work to be performed on the cluster, such as running a Hadoop, Spark, or Hive job.
-   **Types**:
    -   **Custom JARs**: User-defined MapReduce applications.
    -   **Streaming Programs**: Hadoop Streaming jobs.
    -   **Framework-Specific**: Spark applications, Hive queries, or Presto queries.
-   **Execution Flow**:
    -   Steps are added in sequence and executed in the order defined.
    -   A step can be terminated early if it fails or on user intervention.
-   **Benefits**:
    -   Simplifies job submission and allows monitoring progress via the AWS Management Console.

#### Amazon EMR Studio

Amazon EMR Studio is an integrated development environment (IDE) for data scientists and developers to interactively develop, visualize, and debug big data applications on EMR clusters. It provides a notebook-like interface with support for multiple programming languages and frameworks.

-   **Overview**:
    -   Amazon EMR Studio is an integrated, web-based environment for developing, debugging, and running big data applications using tools like Apache Spark and Jupyter notebooks.
-   **Features**:
    -   **Notebook Integration**: Supports Jupyter-based notebooks for Spark development.
    -   **Collaboration**: Multiple users can collaborate on shared notebooks.
    -   **Job Management**: Enables monitoring and debugging Spark jobs in real time.
    -   **Interactive UI**: Offers a streamlined interface for data scientists and analysts.
-   **Benefits**:
    -   Simplifies development by eliminating the need for SSH or manual job setup.
    -   Enhances productivity through direct integration with EMR clusters and AWS Identity and Access Management (IAM).

#### Security Configurations

Security configurations in EMR define encryption settings, authentication mechanisms, and authorization policies to ensure data security and compliance with regulatory requirements. They can be applied to EMR clusters to enforce security best practices.

-   **Purpose**:
    -   Security configurations define encryption settings, authentication mechanisms, and network policies to safeguard data processed by EMR.
-   **Key Elements**:
    1. **Encryption**:
        - **At Rest**: Data stored in S3, HDFS, or EBS volumes can be encrypted.
        - **In Transit**: Secure communication between cluster nodes using TLS.
    2. **Authentication**:
        - Kerberos integration can be used for secure authentication and authorization.
    3. **Access Control**:
        - IAM roles and policies manage who can access and perform actions on the cluster.
    4. **Data Governance**:
        - AWS Lake Formation or AWS Glue Data Catalog can be used to enforce fine-grained access control.
-   **Configuration**:
    -   Defined during cluster setup via the **Security Configuration** feature in the AWS Management Console.
-   **Compliance**:
    -   Helps meet regulatory requirements such as GDPR, HIPAA, or PCI DSS.

</details>

---

<details><summary style="font-size:25px;color:Orange">AWS Redshift</summary>

Amazon Redshift is a fully managed, petabyte-scale data warehousing service provided by AWS (Amazon Web Services). It is designed to handle large-scale analytics workloads, allowing users to analyze vast amounts of data quickly and cost-effectively.
Amazon Redshift is a fully managed data warehousing service provided by AWS, designed for running analytics queries on large datasets. Here are some key terms and concepts associated with AWS Redshift:

-   **Cluster**: A cluster is the main computing and storage infrastructure in Amazon Redshift. It consists of one or more compute nodes (instances) and an optional leader node. The leader node manages query execution and optimization, while the compute nodes store data and perform parallel query processing.

-   **Node Type**: A node type defines the computing and storage capacity of each node in a Redshift cluster. AWS offers different node types optimized for various workloads and use cases, such as dense compute, dense storage, and RA3 (managed storage).

-   **Leader Node**: The leader node in a Redshift cluster coordinates query execution, optimization, and communication among compute nodes. It distributes queries to compute nodes, aggregates results, and sends them back to clients.

-   **Compute Node**: Compute nodes in a Redshift cluster store data blocks and perform query processing in parallel. They execute SQL queries, perform data filtering, aggregation, and sorting operations, and participate in data distribution and redistribution tasks.

-   **Data Warehouse**: A data warehouse is a central repository for storing and analyzing structured data from various sources. Amazon Redshift serves as a fully managed data warehouse solution, providing scalable storage and compute resources for analytics workloads.

-   **Columnar Storage**: Redshift stores data in a columnar format, where each column is stored separately on disk. This storage model enables efficient compression, encoding, and query performance for analytical workloads, especially those involving aggregation and filtering of data.

-   **Distribution Styles**: Redshift supports different distribution styles for distributing data across compute nodes in a cluster. These include EVEN distribution, KEY distribution, and ALL distribution. Distribution styles impact query performance and resource utilization.

-   **Sort Keys**: Sort keys define the order in which data is physically stored on disk within each compute node. Redshift supports `compound` and `interleaved` sort keys, which influence query performance by reducing the need for data sorting during query execution.

-   **Data Compression**: Redshift employs column-level compression techniques to reduce storage space and improve query performance. It automatically chooses the most appropriate compression algorithms based on data types and distributions.

-   **Workload Management (WLM)**: WLM is a feature of Redshift that manages query queues and resource allocation to ensure optimal performance and concurrency. It allows users to define query queues, set concurrency limits, and prioritize query execution based on workload requirements.

-   **Amazon Redshift Spectrum**: Redshift Spectrum is a feature that extends Redshift's querying capabilities to data stored in Amazon S3. It enables users to run SQL queries on data stored in S3 without loading it into a Redshift cluster, providing cost-effective storage and on-demand querying.

-   **Cluster Snapshot**: An AWS Redshift Cluster Snapshot is a point-in-time backup of an Amazon Redshift cluster. It captures the cluster's data and metadata, enabling you to restore the cluster to the state it was in when the snapshot was taken. Snapshots are essential for data protection, disaster recovery, and maintaining data consistency.

    -   **Automated Snapshots**:

        -   Automatically created by Amazon Redshift at regular intervals.
        -   Controlled by the backup retention period, which can range from 1 to 35 days.
        -   Deleted automatically after the retention period unless manually converted to a manual snapshot.

    -   **Manual Snapshots**:
        -   Created by the user explicitly.
        -   Retained until the user deletes them.
        -   Useful for long-term backups or before performing critical operations, such as upgrades or major schema changes.

    1. `Point-in-Time Backup`: Includes all data in the cluster, including user-defined tables, system tables, and metadata (e.g., schemas, access control settings).
    2. `Incremental Backups`: Snapshots are incremental, meaning only the data that has changed since the last snapshot is stored. This reduces storage costs.
    3. `Restoration`: Snapshots can be used to create a new cluster or restore an existing cluster to the snapshot's state.
    4. `Cross-Region Snapshots`: Snapshots can be automatically copied to other AWS regions for disaster recovery or compliance needs.
    5. `Encryption`: If your Redshift cluster is encrypted, snapshots will also be encrypted.

-   **Federated Query**: A Federated Query refers to the ability to run SQL queries across multiple, diverse data sources as if they were part of the same database. This is particularly powerful when you need to analyze data stored in different systems without needing to move it into a single location.

    1. `Amazon Athena Federated Query`

        - Amazon Athena is a serverless query service that allows you to query data in S3 using SQL. With Athena Federated Query, you can extend this functionality to other data sources, such as RDS databases (Aurora, PostgreSQL, MySQL), DynamoDB, Redshift, JDBC sources, or even on-premises databases.
        - `How it works`: Athena connects to data sources through AWS Lambda functions, which act as data source connectors. When you run a query, Athena invokes the Lambda connector, retrieves the data, and processes it in the query. Results are returned to you as if the data came from a single source.

    2. `Amazon Redshift Federated Query`
        - With Amazon Redshift, you can use Federated Query to query live data in Amazon RDS, Amazon Aurora PostgreSQL, and other Redshift clusters.
        - `Use case`: This feature is useful for scenarios where you need to join and analyze data in Redshift with data in an external database, without duplicating or moving the data.
        - `Example`: You can run a query in Redshift that joins tables in Redshift with tables in an RDS Aurora PostgreSQL database.
        - `Architecture`: Redshift uses Amazon Redshift Spectrum to handle federated queries. Redshift Spectrum allows querying data in S3, but Federated Query extends this by enabling queries across both S3 and RDS/Aurora databases.

#### AWS Redshift Serverless

-   Redshift Serverless eliminates the need to provision and manage clusters
-   Works similarly to other AWS serverless services like Lambda or DynamoDB
-   No need to create a cluster; data storage and querying can begin immediately

-   **Key Components**

    -   **Namespace**
        -   A namespace contains database objects (e.g., tables, users, and backups)
        -   Default settings or custom settings can be used during setup
        -   Example: Setting namespace as `my-first-namespace` with a default database `dev`
        -   Can associate an IAM role for permissions and logging
    -   **Work Group**
        -   Contains compute resources measured in Redshift Processing Units (RPU)
        -   Defines how much capacity the system will use for processing
        -   Capacity starts at 8 RPUs (for up to 128 GB storage) and can go up to 512 RPUs
        -   Can customize the work group, e.g., naming it `my-first-group`
        -   Security settings: Define security groups and subnets for the work group

-   **Setting up Redshift Serverless**

    -   Start by creating a namespace and work group
        -   Example: Customize the namespace and work group during creation
    -   `Configure capacity`: Start with a base capacity of 8 RPUs
        -   Can later scale up in increments of 8 RPUs (e.g., 16, 24 RPUs) without downtime
    -   `Configure security`: Choose the security group and subnets
    -   Associate IAM roles as needed
    -   Once the configuration is completed, the Redshift Serverless environment is ready

-   **Benefits of AWS Redshift Serverless**

    -   `Pay-for-use model`
        -   You only pay for the compute capacity and resources used
        -   No need for cluster management or scaling configurations
    -   `Simplified querying`: Use Redshift Query Editor v2 or third-party tools to run queries
    -   AWS provides a $300 credit for first-time users of Redshift Serverless

-   **Monitoring and Scaling**

    -   Monitor compute usage via the work group
        -   View usage statistics over the past few hours (e.g., last 3 or 6 hours)
        -   Check remaining credits from the $300 trial credit
    -   `Scaling compute capacity`:
        -   Adjust base RPU capacity from the work group (e.g., 8 to 16 RPUs)
        -   Scaling happens without downtime in increments of 8 RPUs
    -   `Namespace management`:
        -   Contains database and backup information
        -   Allows for secure integrations like zero ETL integration and user-level configuration
        -   Manage users and permissions at the schema level

-   **Connecting to Redshift Serverless**
    -   Use Query Editor v2 or third-party tools to connect
    -   `Provide connection details`: database username and password
        -   Example: Username `redshift-admin` with password set during work group creation
    -   Use the connection details (e.g., endpoint, port number) to connect via external tools

#### How AWS Redshift is Used in Industries

-   **Data Warehousing and Analytics**:

    -   AWS Redshift is primarily used for large-scale data warehousing. It allows businesses to store and analyze large datasets.
    -   Companies use Redshift to run complex queries on large datasets, perform business intelligence (BI) analytics, and generate reports. For example, an e-commerce company might use Redshift to analyze customer behavior and optimize marketing strategies.

-   **Big Data Processing**:

    -   Redshift can handle big data workloads efficiently.
    -   Organizations process and analyze petabytes of data from various sources like log files, transactional databases, and IoT devices. For instance, a financial institution might use Redshift to process and analyze transaction data for fraud detection.

-   **Data Integration**:

    -   Redshift integrates with various data sources for data consolidation.
    -   Companies often use Redshift to consolidate data from different systems (CRM, ERP, etc.) into a single repository for unified analytics. For example, a healthcare provider might integrate patient records from multiple systems into Redshift for comprehensive analysis.

-   **Business Intelligence and Reporting**:

    -   Redshift supports BI tools and reporting services.
    -   Redshift serves as the backend for BI tools like Tableau, Looker, and Power BI, providing the data needed for dashboards and reports. A retail chain might use BI tools to create sales performance dashboards based on data in Redshift.

-   **Advanced Analytics and Machine Learning**:
    -   Redshift supports advanced analytics and machine learning through integrations.
    -   Organizations use Redshift for predictive analytics and machine learning models. For example, an online streaming service might use Redshift to analyze viewing patterns and recommend new content to users.

#### Cluster Management Models

-   **24/7 Availability**:

    -   Some organizations keep their Redshift clusters running 24/7 to ensure constant access to data.
    -   This model is used when real-time or frequent access to data is required, such as in high-frequency trading scenarios or continuous analytics for large-scale operations.

-   **On-Demand / Scheduled Usage**:

    -   Redshift clusters can be started and stopped on demand or scheduled to run only during specific times.
    -   This model is used to save costs when data processing or analysis is needed only during certain hours. For example, a company might run their Redshift cluster only during business hours or during batch processing windows.

-   **Data Pipeline and ETL Processes**:

    -   Clusters may be used for specific ETL (Extract, Transform, Load) processes.
    -   Redshift clusters might be used to load data from source systems, perform transformations, and then store the results for further analysis. This is common in scenarios where data is loaded from sources at regular intervals.

#### Common Use Cases

1. **Customer Analytics**: Understanding customer behavior and preferences through sales data and transaction analysis.
2. **Financial Analysis**: Managing and analyzing financial transactions, reports, and forecasting.
3. **Operational Reporting**: Generating regular reports for operations, such as inventory management or performance metrics.
4. **Marketing Analytics**: Evaluating marketing campaign effectiveness and customer engagement.
5. **Data Aggregation**: Combining data from different sources for a unified view and analysis.
6. **Compliance Reporting**: Preparing reports for regulatory compliance in industries like finance and healthcare.

#### Example of Redshift Use

| **Industry**   | **Use Case**                   | **Example**                                            |
| -------------- | ------------------------------ | ------------------------------------------------------ |
| **Retail**     | Customer Behavior Analysis     | Analyzing purchase patterns to optimize inventory.     |
| **Finance**    | Fraud Detection                | Analyzing transaction data for suspicious activities.  |
| **Healthcare** | Patient Data Integration       | Aggregating patient records from different systems.    |
| **E-commerce** | Sales Performance Analytics    | Evaluating sales data to adjust marketing strategies.  |
| **Telecom**    | Network Performance Monitoring | Analyzing network traffic data for performance issues. |

</details>

---

<details><summary style="font-size:25px;color:Orange">AWS Glue</summary>

-   [AWS Glue ETL scripts in PySpark](https://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-python.html)

AWS Glue is a fully managed extract, transform, and load (ETL) service provided by Amazon Web Services (AWS). It offers a range of features and components for building and managing data integration workflows. Here's an explanation of the terms and concepts used in AWS Glue:
AWS Glue is a fully managed ETL (Extract, Transform, Load) service that simplifies data preparation, transformation, and loading processes for analytics. It automates much of the work involved in data integration, providing a scalable platform for processing large data sets. Here are the main concepts in AWS Glue:

-   `ETL`: Stands for Extract, Transform, and Load. It refers to the process of extracting data from various sources, transforming it into a desired format, and loading it into a target destination, such as a data warehouse or data lake.
-   `Jobs`: In AWS Glue, jobs are ETL workflows that define the data transformation logic to be applied to datasets. Jobs are created using the Glue ETL language, which is based on Apache Spark. Jobs can perform various data processing tasks, such as filtering, aggregating, joining, and transforming data.
-   `Development Endpoints`: Development endpoints are AWS Glue resources that provide an environment for developing and testing ETL scripts and jobs. They allow developers to interactively write, debug, and run Glue ETL scripts using tools like Jupyter notebooks or integrated development environments (IDEs).
-   `Triggers`: Triggers are AWS Glue components used to schedule the execution of ETL jobs based on time or event triggers. They enable automation of data processing workflows by specifying when jobs should be run, such as hourly, daily, or in response to data arrival events.
-   `Schedulers`: Schedulers are AWS Glue components responsible for managing the execution and scheduling of ETL jobs. They ensure that jobs are executed according to the specified schedule, monitor job execution status, and handle job failures or retries.
-   `Connections`: Connections are AWS Glue resources used to define and store connection information for accessing external data sources, such as databases, data warehouses, or cloud storage services. They store connection parameters like endpoint URL, port number, authentication credentials, and encryption settings.
-   `Security and Access Control`: AWS Glue provides features for managing security and access control to data and resources. It integrates with AWS `IAM` (Identity Access Management) to control user access to Glue resources, enforce permissions, and audit user actions. Glue also supports encryption of data at rest and in transit for enhanced security.
-   `Serverless Architecture`: AWS Glue is built on a serverless architecture, which means that users do not need to provision or manage any infrastructure. AWS Glue automatically scales resources up or down based on demand, allowing users to focus on building and managing data integration workflows without worrying about underlying infrastructure.

#### Data Catalog

The **AWS Glue Data Catalog** is a centralized metadata repository that stores information about data sources. It is a key component of AWS Glue, providing a catalog of data for discovery, querying, and processing.
The AWS Glue Data Catalog is a central metadata repository that stores metadata information about datasets, tables, and schemas. It provides a unified view of the data assets within an organization and enables data discovery, querying, and analysis.
Data Catalog is the central metadata repository within AWS Glue. It acts as a unified metadata repository for all your data sources and stores metadata about data structures and schema. Here are its key features and concepts:

-   `Metadata Storage`: Stores information such as table definitions, schemas, and locations of data in S3, RDS, Redshift, and other sources.
-   `Centralized Repository`: Provides a single place to store and access metadata, making it easy to discover and manage data.
-   `Automatic Schema Discovery`: Works with Crawlers to automatically infer and catalog the schema of your data.
-   `Integration with AWS Services`: Integrates seamlessly with AWS services like Amazon Athena, Amazon Redshift Spectrum, and Amazon EMR for querying and analysis.
-   **Features**:
    -   Stores **table definitions**, schema information, and metadata for data sources (e.g., S3, RDS, Redshift).
    -   Automatically crawls data sources to extract metadata.
    -   Provides a unified view of data across different data stores.
    -   Integrated with services like **Amazon Athena** and **Amazon Redshift Spectrum** for querying.

#### Crawlers

A **crawler** in AWS Glue is used to automatically scan data stores and extract metadata to populate the Glue Data Catalog. Crawlers determine the schema of the data and create or update tables in the Data Catalog.
Crawlers are AWS Glue components used to automatically discover and catalog data stored in various data sources, such as Amazon S3, Amazon RDS, Amazon Redshift, and databases hosted on-premises or in other cloud platforms. Crawlers analyze data in these sources, infer its schema, and create metadata entries in the Glue Data Catalog.
Crawlers are components in AWS Glue that automate the process of discovering and cataloging data. Crawlers traverse your data sources, inspect the data, and infer the schema to populate the Data Catalog. Key aspects include:

-   `Schema Inference`: Automatically determines the structure of your data, such as tables and columns.
-   `Data Source Detection`: Can work with various data sources including S3, RDS, DynamoDB, and more.
-   `Scheduled Runs`: Can be scheduled to run at regular intervals to keep the Data Catalog up-to-date with changes in the data.
-   `Output`: Creates or updates tables in the Data Catalog with the inferred schema and metadata.

-   **Features**:
    -   Can crawl structured and semi-structured data in **Amazon S3**, **RDS**, **DynamoDB**, and other sources.
    -   Automatically infers the schema, partitions, and formats of the data.
    -   Supports custom classifiers for non-standard data formats.

#### Classifiers

Classifiers are AWS Glue components used to classify the format and structure of data files. They analyze the content of data files and determine their file format, compression type, and schema. Glue provides built-in classifiers for common file formats like CSV, JSON, Parquet, and Avro, as well as custom classifiers for proprietary formats.
A **classifier** in AWS Glue is a rule that determines the format and structure of a data source, such as CSV, JSON, or Parquet.

-   Classifiers in AWS Glue help Crawlers understand the structure of your data. They determine the schema of the data by recognizing patterns in the data files. Classifiers can be predefined or custom:

-   `Built-in Classifiers`: AWS Glue comes with a set of built-in classifiers for common file types like JSON, CSV, Parquet, Avro, etc.
-   `Custom Classifiers`: You can create custom classifiers using grok patterns, JSONPath, or XML tags to handle specific data formats.
-   `Pattern Matching`: Classifiers use pattern matching to determine how to parse and structure the data.
-   `Integration with Crawlers`: Crawlers use these classifiers to infer the schema of your data and create corresponding tables in the Data Catalog.

-   **Features**:
    -   AWS Glue comes with built-in classifiers for common file formats.
    -   You can create **custom classifiers** to handle non-standard or proprietary data formats.

#### Glue ETL Jobs

An **ETL job** in AWS Glue defines the process of extracting data from a source, transforming it based on business logic, and loading it into a destination (e.g., S3, Redshift, RDS).

-   **Types of Jobs**:

    -   **Python or PySpark Scripts**: Glue jobs typically run Python or PySpark scripts to process and transform data.
    -   **Spark-based ETL**: AWS Glue runs on **Apache Spark** under the hood for large-scale data processing.

-   **Job Creation**:
    -   AWS Glue can automatically generate ETL code using its **Job Wizard**, based on the source and target data schemas.
    -   Users can write custom transformation logic in **PySpark** or **Python**.

#### Glue Triggers

**Triggers** in AWS Glue are used to automate the start of jobs based on a schedule or event.

-   **Types of Triggers**:
    -   **Time-based**: Schedule jobs to run at specific times using cron expressions.
    -   **On-demand**: Manually trigger jobs as needed.
    -   **Event-based**: Chain multiple jobs to trigger on the completion of other jobs or based on other event types (e.g., database updates).

#### Glue Workflows

A **workflow** in AWS Glue is a collection of jobs, crawlers, and triggers organized in a directed acyclic graph (DAG) that defines the sequence of tasks.

-   **Features**:
    -   Workflows enable the orchestration of complex ETL pipelines.
    -   You can define dependencies between jobs and automate multi-step ETL processes.

#### Glue Connection

A **connection** in AWS Glue is used to define how AWS Glue interacts with external data sources (e.g., relational databases, data warehouses).

-   **Features**:
    -   Supports a variety of connection types, such as **JDBC** connections to relational databases (RDS, Redshift).
    -   Allows for secure access to data sources with VPC-based security configurations.

#### Glue Studio

AWS Glue **Studio** is a graphical interface for building, running, and monitoring ETL jobs.

-   **Features**:
    -   Provides a drag-and-drop interface for creating ETL workflows without needing to write code.
    -   Users can visually define the data flow and the transformations required on the data.

#### Glue DataBrew

AWS Glue DataBrew is a powerful visual data preparation tool designed to simplify the process of cleaning, transforming, and analyzing data. It is part of the AWS Glue ecosystem, which provides a serverless environment for data integration, ETL (Extract, Transform, Load), and analytics.

AWS Glue DataBrew is a fully managed, no-code data preparation service that enables users to clean, transform, and visualize data without writing any code. DataBrew provides a simple, interactive interface to work with data from various sources, perform data transformations, and prepare the data for analysis or machine learning (ML).

-   **Key Features**:

    -   `Visual Interface`: A drag-and-drop interface for data transformation and cleaning.
    -   `Pre-built transformations`: Over 250 built-in transformations to handle common data preparation tasks such as data cleaning, filtering, grouping, and more.
    -   `Data Profiling`: Provides insights into your data’s quality, distribution, and patterns.
    -   `Data Exploration`: Easy data exploration features to inspect and filter datasets interactively.
    -   `Integrated with AWS Services`: Integrates well with AWS analytics and machine learning services like Amazon S3, Amazon Redshift, Amazon RDS, and AWS Glue.

-   **Projects**: A DataBrew project allows you to create, manage, and organize data transformation tasks. A project contains the following:

    -   `Dataset`: The data you’re working on.
    -   `Recipe`: A series of transformations applied to the dataset.
    -   `Profile and Data Visualizations`: Insights into the dataset, like distributions, missing values, and outliers.

    -   Projects allow users to experiment with and refine transformations before creating a recipe or final output.

-   **Datasets**: Datasets in DataBrew represent the data you want to transform and prepare for analysis. These datasets can come from a variety of sources such as Amazon S3, Amazon RDS, Amazon Redshift, Amazon Athena, and Amazon DynamoDB

    -   When you create a dataset in DataBrew, you specify the data source, and DataBrew automatically ingests the data into the workspace for transformation.

-   **Recipes**: Recipes are a set of transformations applied to datasets. You can think of a recipe as a step-by-step guide for cleaning and transforming data. Recipes are reusable, meaning you can apply them to other datasets for similar transformations. Common transformations include:

    -   `Cleaning`: Removing duplicates, handling missing values, or fixing incorrect data types.
    -   `Normalization`: Scaling or standardizing numerical values.
    -   `Filtering`: Removing outliers or unnecessary rows based on specified conditions.
    -   `Column Operations`: Adding new columns, renaming, or dropping columns.
    -   `Grouping and Aggregation`: Summarizing data by applying functions like sum, average, etc.
    -   `Joins`: Merging data from different datasets.

-   **Transformation Steps**: Each recipe consists of multiple **transformation steps**, which can be executed one after another. These steps can be added using the visual interface, and each step is an operation performed on your dataset. Transformation steps include:

    -   `Built-in Functions`: DataBrew provides over 250 predefined functions that cover common operations like filtering, aggregation, string manipulations, and more.
    -   `Custom Expressions`: You can also define custom expressions using a formula editor for advanced transformations.
    -   `Data Type Conversions`: Automatically convert columns to the right data types (e.g., from string to date).

-   **Data Profiling**: Data profiling is the process of inspecting a dataset to understand its quality and distribution. AWS Glue DataBrew automatically analyzes the dataset to provide a profile that includes:

    -   `Column statistics`: Counts, averages, min/max values, and unique counts.
    -   `Data Quality Indicators`: Missing values, duplicates, and outliers.
    -   `Data Distribution`: Histograms, value distributions, and data patterns.

    -   These insights help you understand the state of your data before performing transformations.

-   **Schedules**: You can schedule the execution of recipes to run periodically or based on specific events. Scheduling is useful when you need to automate data transformations or refresh datasets regularly. You can set up scheduled jobs to:

    -   Run recipes on a defined frequency (e.g., daily, weekly).
    -   Execute upon the arrival of new data in an S3 bucket or another source.

-   **Outputs**: After running a recipe on a dataset, you’ll want to store or output the transformed data. AWS Glue DataBrew supports several output options:

    -   `Amazon S3`: Output data can be stored as CSV, Parquet, JSON, or other formats.
    -   `Amazon Redshift`: You can write the output directly into a Redshift data warehouse.
    -   `Amazon RDS`: Results can also be written back to RDS instances.
    -   `AWS Glue Data Catalog`: The results of transformations can be registered in the AWS Glue Data Catalog, allowing you to use the data in other services like Athena, Redshift Spectrum, or Amazon EMR.

-   **Job Execution**: Once a recipe has been created, you can turn it into an **AWS Glue Job**. Jobs execute the recipe on a dataset and produce the output. You can monitor the progress of jobs, view logs, and track performance.

-   **DataBrew Workflow**: The typical workflow in AWS Glue DataBrew involves the following steps:

    -   `Data Ingestion`: First, you connect to your data source (e.g., S3, Redshift, RDS, or Athena) and create a dataset.
    -   `Data Exploration and Profiling`: Explore the data by inspecting the columns, missing values, and distributions. Use profiling to understand data quality and potential issues.
    -   `Data Transformation`: Create a project and apply transformations to the dataset using recipes. DataBrew provides visual tools to apply these transformations.
    -   `Data Output`: After applying transformations, you can output the clean data to Amazon S3, Redshift, or other services.
    -   `Automation`: Optionally, schedule jobs to automate data processing workflows.

-   **Security & Access Control**: AWS Glue DataBrew integrates with AWS Identity and Access Management (IAM) to manage user permissions. You can specify which users or roles can access specific datasets, projects, and recipes. Additionally, it integrates with AWS Key Management Service (KMS) for data encryption and ensures that data privacy and access control are enforced.

-   **Security Features**:

    -   **IAM-based access control** for granular user permissions.
    -   **Encryption** of data at rest and in transit.
    -   **Audit logging** through AWS CloudTrail for monitoring user activity.

-   **Pricing**: AWS Glue DataBrew is priced based on two primary factors:
    -   `Data Processing`: You are charged for the time that DataBrew spends processing your datasets, typically based on the number of data rows and transformation complexity.
    -   `Job Execution`: You are also charged for the execution of Glue Jobs based on compute usage.

#### Glue Job Bookmarks

**Job bookmarks** in AWS Glue are used to track the processing state of jobs. This allows AWS Glue to process only new or updated data since the last run, making ETL jobs more efficient.

-   **Features**:
    -   Tracks previously processed data to avoid reprocessing.
    -   Can be used to incrementally process data from sources such as S3 or relational databases.

#### Glue DynamicFrames

A **DynamicFrame** is an extension of the Apache Spark DataFrame, designed specifically for AWS Glue. It allows for more flexible data transformations by providing support for semi-structured data.

-   **Features**:
    -   **Schema flexibility**: Can handle missing or inconsistent data without enforcing a strict schema.
    -   **Ease of transformation**: Includes built-in functions for transforming and cleaning data.

#### Glue Partitions

AWS Glue supports **partitioning** of data to improve query performance. Partitioning splits data into smaller chunks based on specific keys (e.g., date, region).

-   **Features**:
    -   Reduces the amount of data scanned for queries or ETL jobs.
    -   Useful when working with large datasets in Amazon S3 or other distributed storage systems.

#### Glue Dev Endpoints

A **Glue Dev Endpoint** allows you to interactively develop and test ETL scripts using **Apache Zeppelin** notebooks or IDEs like **PyCharm**.

-   **Features**:
    -   Provides an interactive development environment for testing PySpark scripts.
    -   Can be used to connect to AWS Glue Data Catalog and run jobs in a development setting before deploying them to production.

#### AWS Glue Data Lakes

Glue integrates with **data lakes** for data cataloging, processing, and querying. Data lakes store large amounts of structured and unstructured data.

-   **Integration with AWS Lake Formation**: AWS Glue works seamlessly with AWS Lake Formation for creating, managing, and securing a data lake.

#### Glue Transformations

AWS Glue provides several built-in transformations to clean and prepare data:

-   **Mapping**: Apply transformations to fields (e.g., renaming, converting data types).
-   **Filtering**: Exclude or include rows based on specific conditions.
-   **Joining**: Join datasets based on a common key.
-   **Aggregating**: Perform aggregate functions (e.g., sum, average) on datasets.

#### Glue Metrics and Logging

AWS Glue provides detailed logging and monitoring of ETL jobs:

-   **Amazon CloudWatch**: Monitor job logs, performance metrics, and failures in real time.
-   **Job Metrics**: Provides information on job execution time, processed data volume, and errors.

Monitoring AWS Glue jobs through AWS CloudWatch is crucial for ensuring data pipelines run efficiently and reliably. Here are some key AWS Glue metrics that can be monitored in CloudWatch:

1. **Job Metrics**

    - **`Glue.JobRunsSucceeded`**: The number of Glue job runs that have succeeded.
    - **`Glue.JobRunsFailed`**: The number of Glue job runs that have failed.
    - **`Glue.JobRunsStopped`**: The number of Glue job runs that have been manually stopped.
    - **`Glue.JobRunsTimeout`**: The number of Glue job runs that have timed out.
    - **`Glue.JobRunTime`**: The amount of time a Glue job took to execute (in milliseconds).
    - **`Glue.ConcurrentRunsExceeded`**: The number of jobs that couldn't start because the concurrent job run limit was exceeded.

2. **Crawler Metrics**

    - **`Glue.CrawlerSucceeded`**: The number of crawlers that succeeded.
    - **`Glue.CrawlerFailed`**: The number of crawlers that failed.
    - **`Glue.CrawlerStopped`**: The number of crawlers that were stopped.
    - **`Glue.CrawlerRunTime`**: The time taken for the crawler to complete its task (in milliseconds).

3. **Data Quality Metrics**

    - **`Glue.RowsWritten`**: Number of rows written by a Glue job to a target.
    - **`Glue.RowsRead`**: Number of rows read by a Glue job from the source.
    - **`Glue.DPUHours`**: The aggregate DPU (Data Processing Unit) hours used by Glue jobs.

4. **Partition Metrics**

    - **`Glue.PartitionsCreated`**: The number of partitions that Glue created in the catalog.
    - **`Glue.PartitionsDeleted`**: The number of partitions deleted in the catalog.

5. **Error Handling and Exceptions**
    - **`Glue.Errors`**: The number of errors that occurred during job execution.
    - **`Glue.ResourceErrors`**: Errors related to insufficient resources (memory, DPUs, etc.).
    - **`Glue.CodeErrors`**: Errors caused by problems in the job code.
    - **`Glue.ServiceErrors`**: Errors related to AWS Glue service failures.

These metrics provide insights into job performance, resource usage, and errors, which help in proactive monitoring and troubleshooting.

</details>

---

<details><summary style="font-size:25px;color:Orange">Lake Formation</summary>

AWS Lake Formation is a managed service that simplifies and automates the process of setting up, securing, and managing a data lake. A data lake is a centralized repository that allows you to store all your structured and unstructured data at any scale. You can store your data as-is, without having to first structure the data, and run different types of analytics—from dashboards and visualizations to big data processing, real-time analytics, and machine learning.
AWS Lake Formation offers a holistic solution for managing data lakes, simplifying setup and management, enhancing security, improving governance, and integrating seamlessly with AWS analytics tools. It empowers organizations to quickly derive insights from data while ensuring compliance, scalability, and operational efficiency.

#### Key Features of AWS Lake Formation

AWS Lake Formation provides a comprehensive suite of features that simplify the creation and management of data lakes, enhance data security, improve governance, and seamlessly integrate with AWS analytics services. Here's a detailed explanation of the features and their benefits:

1. **Simplifies Data Lake Setup**: Lake Formation streamlines the complex process of setting up a data lake, reducing time and effort.

    - `Data Ingestion`: Automates the collection of data from various sources, including databases (e.g., RDS, MySQL), on-premises data, and third-party services.
    - `Schema Discovery`: Automatically detects and catalogs data schemas in the AWS Glue Data Catalog.
    - `Pre-Built Blueprints`: Provides ready-to-use templates for common data lake tasks, such as ingesting data from databases or S3.

2. **Enhances Data Security**: Lake Formation provides advanced security features to protect sensitive data.

    - `Fine-Grained Access Control`: Enables permissions at the database, table, column, or row level.
    - `Tag-Based Policies`: Allows data access policies to be defined based on tags like "Confidential" or "PII."
    - `Encryption`: Provides server-side encryption using AWS Key Management Service (KMS) for data at rest and HTTPS for data in transit.
    - `Integration with AWS Identity and Access Management (IAM)`: Ensures secure and role-based access to data resources.

3. **Improves Data Governance**: Lake Formation centralizes and simplifies data governance for compliance and operational efficiency.

    - `Data Lineage`: Track data lineage, ensure compliance with data governance policies and provides transparency and traceability for data governance.
    - `Centralized Permissions`: Manages access policies from a single location, ensuring consistent enforcement across datasets.
    - `Auditing and Monitoring`: Tracks data access and usage through AWS CloudTrail and CloudWatch.
    - `Data Cataloging`: The Glue Data Catalog stores metadata, making data discoverable and queryable while ensuring governance policies are applied.
    - `Granular Data Filtering`: Allows filtering at the row or column level for queries to restrict access to sensitive information.

4. **Integrates with AWS Analytics Services**: Lake Formation integrates seamlessly with a wide range of AWS analytics and storage services to enable powerful insights.

    - `Amazon Athena`: Enables serverless querying of data stored in the lake using SQL.
    - `Amazon Redshift Spectrum`: Allows querying of S3 data directly from Redshift for complex analytics.
    - `AWS Glue`: Provides ETL capabilities for data transformation and preparation.
    - `Amazon SageMaker`: Supports advanced analytics and machine learning use cases by preparing and feeding data into AI/ML models.
    - `Amazon EMR`: Facilitates big data processing with Hadoop and Spark frameworks.

5. **Data Management**: Lake Formation automates the organization, transformation, and lifecycle management of data in a data lake.
    - `ETL Automation`: Uses AWS Glue to automate Extract, Transform, Load (ETL) jobs for cleaning, transforming, and loading data.
    - `Partitioning and Indexing`: Optimizes data storage by automatically partitioning large datasets and creating indexes for faster queries.
    - `Data Versioning`: Maintains version histories for datasets, enabling rollback or comparison of previous states.

#### Key Terms and Concepts

1. **Data Lake Administrator**

    - A role with comprehensive control over the data lake.
    - Setting up the data lake, managing security, and configuring policies.

2. **Data Lake**

    - A centralized repository for storing large volumes of diverse data, both structured and unstructured.
    - Allows storage of data in its native format until needed for analysis.

3. **Data Catalog**

    - A central repository to store metadata about the data stored in your data lake.
    - Helps in discovering and managing data within the data lake. The catalog contains information about data locations, schemas, and classifications.

4. **Blueprints**

    - Predefined workflows for common data ingestion and transformation tasks.
    - Simplify the process of importing data from various sources into the data lake.

5. **Data Locations** refer to the individual S3 buckets or prefixes where your raw and processed data resides. These are the specific paths within Amazon S3 that you designate as sources for data ingestion and storage. For example, you might have different S3 buckets for various types of data like logs, transactions, or user data.

6. **Data Lake Location** is the overarching S3 bucket or prefix designated as the central repository for your data lake. It is the primary location that AWS Lake Formation manages and secures. All data ingested into the data lake will ultimately reside within this location, and it serves as the central hub for data storage, access control, and governance.

7. **registering a location** involves specifying and adding Amazon S3 paths that will be managed by Lake Formation. It enables Lake Formation to manage access control, audit logging, and data cataloging for the specified S3 data. This process allows Lake Formation to apply data governance and security controls over these data sources.

    - `Choose S3 Path`: Select the S3 bucket or specific prefix within a bucket where your data resides.
    - `Register in Lake Formation`: Use the Lake Formation console, AWS CLI, or API to register this S3 path.
    - `Assign Permissions`: Define which IAM users and roles can access this data and what permissions they have (e.g., read, write, data location permissions).
    - `Data Governance`: Ensures that data stored in registered locations is secure and accessible only to authorized users.

8. **Table**

    - A logical structure that describes the schema of the data stored in the data lake.
    - Provides structure and schema information for the stored data.

9. **Column**

    - Represents an attribute or field within a table.
    - Defines the data type and nature of the stored data.

10. **Crawler**

    - A tool that scans data in the data lake and automatically identifies the schema, data types, and other metadata.
    - Automates the process of cataloging data.

11. **Fine-Grained Access Control**

    - Controls that allow permissions to be set at a granular level, such as on specific columns or rows of a table.
    - Enhances data security by limiting access to sensitive data.

12. **Tag-Based Access Control (TBAC)**

    - Uses tags to define and enforce access policies.
    - Simplifies management of access control by using metadata tags.

13. **Federated Query**

    - A query that accesses and combines data across different data sources.
    - Allows analysis of data across multiple sources without data movement.

14. **Workflow**

    - A sequence of operations defined to perform tasks such as data ingestion, transformation, and loading.
    - Automates complex data processing tasks.

15. **Data Encryption**

    - The process of encoding data to prevent unauthorized access.
    - Protects data at rest and in transit within the data lake.

16. **Lake Formation Permissions**
    - Policies that control access to data resources within the data lake.
    - Manage who can access data and what operations they can perform.

#### How AWS Lake Formation Works

-   **Setup**:

    -   Define the storage location (Amazon S3).
    -   Configure data lake settings and administrators.

-   **Ingest Data**:

    -   Use blueprints to automate data ingestion from sources like databases, logs, and streams.
    -   Import data into Amazon S3.

-   **Catalog Data**:

    -   Use crawlers to automatically detect and catalog data schemas and metadata.

-   **Secure Data**:

    -   Define fine-grained access policies to secure data.
    -   Use encryption for data at rest and in transit.

-   **Prepare Data**:

    -   Transform and clean data using AWS Glue or other ETL tools.
    -   Organize data into databases and tables in the data catalog.

-   **Analyze Data**:

    -   Integrate with analytics services like Amazon Athena, Amazon Redshift, and Amazon EMR.
    -   Perform queries and analysis on the prepared data.

</details>

---

<details><summary style="font-size:25px;color:Orange">Step Function</summary>

AWS Step Functions is a serverless orchestration service that lets you coordinate multiple AWS services into automated workflows. It helps break complex processes into a series of steps that can run in sequence or parallel. You define each step in the process using a state machine, and Step Functions automatically triggers each step, handles failures, and retries if needed, all while visualizing the flow for easier monitoring and debugging.. Below are the key terms and concepts of AWS Step Functions explained in detail:

#### Terminology, Concepts and Components

-   **State Machine**:

    -   A state machine is a workflow definition in Step Functions. It represents the various steps of your application as states.
    -   The state machine specifies how the states interact with each other, the transitions between states, and the inputs/outputs of each state.
    -   The state machine definition is written in JSON or Amazon States Language (ASL). It defines the states, transitions, input/output, and other configurations.

-   **States**: States are the individual steps in a state machine. Step Functions supports several types of states:

    -   `Task State`: Executes an AWS Lambda function or integrates with other AWS services like SNS, SQS, DynamoDB, etc.
    -   `Choice State`: Adds branching logic to your state machine based on certain conditions.
    -   `Parallel State`: Executes multiple branches of states simultaneously.
    -   `Map State`: Iterates over a list of items and executes the same workflow for each item.
    -   `Wait State`: Introduces a delay for a specified amount of time before moving to the next state.
    -   `Succeed State`: Indicates that the execution has succeeded.
    -   `Fail State`: Indicates that the execution has failed and provides error information.
    -   `Pass State`: Passes its input to its output, performing no work.

-   **Transitions**: Transitions define how the execution moves from one state to another. This is determined by the Next field or by the End field in the state definition.

-   **[Amazon States Language (ASL)](https://states-language.net/)**: ASL is the JSON-based, structured language used to define state machines. It includes the syntax for defining states, transitions, and error handling. Detailed Explanation of Common Fields:

    -   `Type`: Defines the type of state (Task, Choice, Succeed, Fail, etc.).
    -   `Resource`: Specifies the ARN of the resource to be executed (e.g., Lambda function ARN).
    -   `Next`: Specifies the next state to transition to after the current state completes.
    -   `End`: If set to true, designates the state as the final state.
    -   `InputPath`: JSONPath that selects part of the state input to be passed to the resource.
    -   `OutputPath`: JSONPath that selects part of the state output to be passed to the next state.
    -   `Parameters`: Passes specific JSON as input to the resource.
    -   `ResultPath`: Specifies where to place the result of the resource's execution in the state’s input.
    -   `ResultSelector`: Manipulates the raw result from the resource before it’s passed to the ResultPath.
    -   `Retry`: Array of retry policy objects that define retry logic for a state.
    -   `Catch`: Array of catcher objects that define what to do if an error is encountered.

-   **Execution**: An execution is an instance of your state machine in action. Each execution is unique and can be tracked separately.
-   **Context Object**: The context object contains metadata about the execution, such as execution ID, name, and start time. It can be accessed within the state machine.
-   **Event**: Events are the inputs, outputs, and error messages generated by each state during execution.
-   **Input and Output**: Each state can receive input, process it, and produce output. The output of one state can be the input for the next state.

    -   `Parameters`: Parameters are used to specify which parts of the input are passed to the state’s resource. They allow the customization of input data passed to the resource that performs the task.
    -   `ResultPath`: ResultPath is a field that specifies where to place the results of a state in the overall execution’s input JSON. This allows the combining of state outputs with the initial input.
    -   `InputPath`: Select a part of the JSON input to pass to the state.
    -   `OutputPath`: Select a part of the JSON output to pass to the next state.

-   **Error Handling**: AWS Step Functions support robust error handling with `Retry` and `Catch` fields.
    -   `Retry`: Defines retry behavior for states in case of errors. You can specify the number of retry attempts, interval between retries, and backoff rate.
    -   `Catch`: Defines how to handle errors that occur during state execution. You can specify different catch blocks for different error types.

#### Example Workflow with State Machine Definition

Consider a simple order processing workflow:

-   **Order Received (Task State)**:

    -   A Lambda function processes the order and checks inventory.
    -   Transitions to the next state based on the result.

-   **Check Inventory (Choice State)**:

    -   If the inventory is sufficient, proceed to the billing state.
    -   If the inventory is insufficient, move to the out-of-stock state.

-   **Bill Customer (Task State)**:

    -   Charges the customer using a payment service.
    -   If successful, proceed to the shipping state.
    -   If failed, retry the billing process.

-   **Ship Order (Task State)**:

    -   Calls a shipping service to ship the order.
    -   Ends the workflow with success.

-   **Out of Stock (Fail State)**:

    -   Ends the workflow indicating that the item is out of stock.

```json
{
    "Comment": "A simple order processing state machine",
    "StartAt": "OrderReceived",
    "States": {
        "OrderReceived": {
            "Type": "Task",
            "Resource": "arn:aws:lambda:us-east-1:123456789012:function:ProcessOrder",
            "Next": "CheckInventory"
        },
        "CheckInventory": {
            "Type": "Choice",
            "Choices": [
                {
                    "Variable": "$.inventoryAvailable",
                    "BooleanEquals": true,
                    "Next": "BillCustomer"
                },
                {
                    "Variable": "$.inventoryAvailable",
                    "BooleanEquals": false,
                    "Next": "OutOfStock"
                }
            ]
        },
        "BillCustomer": {
            "Type": "Task",
            "Resource": "arn:aws:lambda:us-east-1:123456789012:function:BillCustomer",
            "Next": "ShipOrder",
            "Retry": [
                {
                    "ErrorEquals": [
                        "BillingError",
                        "Lambda.ServiceException",
                        "Lambda.AWSLambdaException"
                    ],
                    "IntervalSeconds": 5,
                    "MaxAttempts": 3,
                    "BackoffRate": 2.0
                }
            ]
        },
        "ShipOrder": {
            "Type": "Task",
            "Resource": "arn:aws:lambda:us-east-1:123456789012:function:ShipOrder",
            "End": true
        },
        "OutOfStock": {
            "Type": "Fail",
            "Error": "OutOfStockError",
            "Cause": "The item is out of stock."
        }
    }
}
```

#### Use Cases

-   **ETL and Data Processing**: Orchestrate ETL (Extract, Transform, Load) workflows by integrating with AWS Glue, Lambda, and S3.
-   **Microservices Coordination**: Coordinate microservices architectures, ensuring the right services are called in the correct sequence with error handling.
-   **Long-Running Processes**: Manage long-running processes such as order fulfillment, user sign-ups, or data analysis tasks that involve multiple steps and services.
-   **Serverless Applications**: Build complex serverless applications by orchestrating Lambda functions and other AWS services without managing servers.
-   **Automation and Batch Jobs**: Automate batch jobs and administrative tasks that require coordination of multiple services.

#### Standard Workflow vs Express Workflow

AWS Step Functions offers two types of workflows to handle different use cases: Express Workflows and Standard Workflows. Each has its own characteristics and is suited for different kinds of tasks.

-   **Standard Workflows**

    -   `Execution Duration`: Standard Workflows can run for up to a year, making them suitable for long-running processes.
    -   `Execution History`: They provide detailed execution history for each step, which is useful for debugging and auditing.
    -   `State Transition`: State transitions are recorded, and you can visualize the execution flow.
    -   `Reliability`: Designed for high reliability and durability, ensuring the state machine's execution is accurately recorded and completed.
    -   `Concurrency`: They support high levels of concurrency but have a rate limit for execution starts.
    -   `Error Handling`: Supports robust error handling and retry mechanisms.

    -   `Use Cases`: Use when you need detailed execution history, long-running processes, complex business logic, and robust error handling.

        -   Long-running ETL processes.
        -   Complex business workflows that require detailed audit trails.
        -   Processes where each step's result and execution path need to be tracked and visualized.

    -   `Pricing`
        -   Pricing is based on the number of state transitions.
        -   Execution time also impacts cost.

-   **Express Workflows**

    -   `Execution Duration`: Express Workflows are designed for short-lived executions, with a maximum duration of five minutes. - `Execution Volume`: Optimized for high-volume, short-duration workloads. - `Concurrency`: Can handle a much higher rate of executions compared to Standard Workflows. - `State Transition`: Transitions are recorded at a summary level rather than a detailed step-by-step history. - `Cost`: Pricing is based on the number of requests and their duration, making it cost-effective for high-frequency, short-duration tasks. - `Reliability`: Provides good reliability, though not as high as Standard Workflows. Suitable for high-scale operations that need to manage massive volumes of requests efficiently.

    -   `Use Cases`: Use when you need to handle a high volume of short-duration executions efficiently and cost-effectively, such as in real-time data processing and event-driven architectures.

        -   Real-time data processing.
        -   Event-driven architectures.
        -   Microservices orchestration.
        -   High-frequency, short-duration jobs such as real-time file processing or data ingestion tasks.

    -   `Pricing`
        -   Based on the number of requests and their duration.
        -   More cost-effective for high-throughput, short-duration tasks.

-   **Detailed Comparison**

    | Feature            | Standard Workflows                             | Express Workflows                                |
    | :----------------- | :--------------------------------------------- | :----------------------------------------------- |
    | Execution Duration | Up to 1 year                                   | Up to 5 minutes                                  |
    | Concurrency        | High, but with rate limits on execution starts | Extremely high, designed for massive concurrency |
    | State Transition   | Detailed history for each step                 | Summary-level transitions                        |
    | Error Handling     | Robust with detailed retry policies            | Basic retry capabilities                         |
    | Execution History  | Detailed and visualized                        | Minimal, focused on summary information          |
    | Cost Model         | Per state transition                           | Per request and duration                         |
    | Use Cases          | Long-running, complex workflows                | Short-duration, high-volume tasks                |

#### Features and Capabilities

-   **Visual Workflow Design**: Step Functions provides a visual editor in the AWS Management Console to create and visualize workflows, making it easier to understand and design complex workflows.
-   **Built-in Error Handling**: Step Functions includes built-in error handling, retry, and catch capabilities to handle errors and exceptions during state execution.
-   **Service Integrations**: Step Functions can integrate with over 200 AWS services, including Lambda, SNS, SQS, DynamoDB, ECS, Batch, Glue, and more. This allows for powerful orchestration of complex tasks across multiple services.
-   **Execution History**: Step Functions provides detailed execution history, including event logs for each step of your workflow. This helps with debugging and monitoring.
-   **Express Workflows**: In addition to standard workflows, Step Functions offers express workflows designed for high-volume, short-duration workflows. They provide lower latency and cost for large-scale applications.

</details>

---

<details><summary style="font-size:25px;color:Orange">Athena</summary>

AWS Athena is an interactive query service provided by Amazon Web Services (AWS) that allows you to analyze data directly in Amazon S3 using standard SQL. It's serverless, which means you don't need to manage any infrastructure, and you only pay for the queries you run. Here are the key terms and concepts related to AWS Athena explained in detail:

1. **Key Concepts and Components**

    - `Amazon S3`: Athena queries data stored in Amazon S3. You can store structured, semi-structured, and unstructured data in S3, and Athena can query this data without requiring it to be loaded into a database.

    - `SQL Queries`: Athena uses SQL (Structured Query Language) for querying data. It supports ANSI SQL, which is the standard SQL language.

    - `Schema-on-Read`: Unlike traditional databases that require schema-on-write (where the schema is defined when the data is written), Athena uses schema-on-read. This means you define the schema at the time of reading the data, making it flexible for querying various types of data without transforming them first.

    - `Tables and Databases`: In Athena, data is organized into databases and tables. These are metadata definitions that describe the structure of your data in S3. Databases are collections of tables, and tables are collections of data structured in columns and rows.

    - `Data Formats`: Athena supports various data formats including CSV, JSON, ORC, Avro, and Parquet. Parquet and ORC are columnar storage formats that provide better performance and lower costs for large datasets.

    - `Partitioning`: Partitioning in Athena helps improve query performance by dividing the data into parts based on a specific column, like date. When a query is run, Athena scans only the relevant partitions instead of the entire dataset.

    - `Catalogs`: Athena uses AWS Glue Data Catalog as a managed metadata repository to store the schema and table information. The Data Catalog integrates with Athena to make it easy to query data stored in S3.

2. **Key Features**

    - `Serverless`: No infrastructure to manage. Athena automatically scales and manages execution resources.

    - `Pay Per Query`: You are billed based on the amount of data scanned by your queries. This means you only pay for the queries you run.

    - `Integration with AWS Services`: Athena integrates seamlessly with other AWS services like AWS Glue, AWS Lambda, Amazon QuickSight, and Amazon Redshift.

    - `Federated Query`: Athena allows you to query data across various sources (like relational, non-relational, object, and custom data sources) without having to move the data.

3. **Performance and Optimization**

    - `Columnar Storage Formats`: Using columnar formats like Parquet or ORC can significantly reduce the amount of data scanned, improving query performance and reducing costs.

    - `Compression`: Compressing your data can also reduce the amount of data scanned, which can lead to cost savings and faster query times.

    - `Partitioning`: By partitioning your data, you can avoid scanning large portions of data, thereby speeding up query performance.

    - `Query Caching`: Athena caches query results, which can be used to speed up repetitive queries.

4. **Use Cases**

    - `Data Lake Analytics`: Athena is ideal for querying large datasets stored in a data lake on S3. It provides a cost-effective and flexible way to analyze data without the need for complex ETL processes.

    - `Log and Event Analysis`: Analyze logs and events stored in S3, such as AWS CloudTrail logs, VPC Flow Logs, or application logs.

    - `Ad-Hoc Queries`: Perform ad-hoc analysis on data stored in S3. Athena's flexibility allows users to quickly answer specific questions without setting up complex infrastructure.

    - `Business Intelligence`: Integrate Athena with business intelligence tools like Amazon QuickSight to create reports and dashboards.

5. **Security**

    - `IAM Policies`: Use AWS Identity and Access Management (IAM) policies to control access to Athena. You can specify who can query which data and control access at the level of databases, tables, and columns.

    - `Encryption`: Athena supports data encryption both at rest (using S3 bucket encryption) and in transit (using SSL/TLS).

    - `Access Control`: Use AWS Glue Data Catalog to manage access control and auditing for your Athena metadata and queries.

6. **Query Execution**

    - `Query Editor`: Athena provides a web-based query editor in the AWS Management Console where you can write and execute SQL queries.

    - `JDBC/ODBC Drivers`: Connect to Athena using JDBC or ODBC drivers from your favorite SQL client or BI tool.

    - `API`: Use the Athena API to programmatically run queries and retrieve results.

7. **Pricing**

    - `Cost Per Query`: You are charged based on the amount of data scanned by your queries. The current pricing (as of the last update) is $5 per terabyte of data scanned.

    - `Cost Optimization`: Optimize costs by compressing data, using columnar formats, and partitioning your data.

-   **Example Use Case**: Suppose you have a large amount of web server log data stored in Amazon S3 in JSON format. Using Athena, you can:

    -   `Create a Table`: Define a table that maps to your JSON log files.

        ````sql
        CREATE EXTERNAL TABLE IF NOT EXISTS web_logs (
            ip STRING,
            timestamp STRING,
            request STRING,
            response_code INT,
            user_agent STRING
        )
        ROW FORMAT SERDE 'org.openx.data.jsonserde.JsonSerDe'
        LOCATION 's3://your-bucket/web-logs/';
            ```

        ````

    -   `Run Queries`: Execute SQL queries to analyze the data.

        ```sql
        SELECT COUNT(*) FROM web_logs WHERE response_code = 404;
        ```

    -   `Optimize`: Store the logs in a columnar format like Parquet and partition them by date for faster query performance and lower costs.

AWS Athena is a powerful tool for data analysis, especially for organizations that store large amounts of data in Amazon S3. Its serverless architecture, pay-per-query model, and integration with other AWS services make it a versatile solution for various analytical needs. Understanding its concepts and best practices can help you efficiently leverage Athena for your data analytics workflows.

</details>

---

<details><summary style="font-size:25px;color:Orange">Load balancer</summary>

In the context of **AWS (Amazon Web Services)**, a **Load Balancer** is a managed service provided by **Elastic Load Balancing (ELB)** that automatically distributes incoming application traffic across multiple targets, such as EC2 instances, containers, IP addresses, and Lambda functions, in one or more Availability Zones. This ensures high availability, fault tolerance, and scalability for your applications.

### Types of AWS Load Balancers

AWS provides the following types of load balancers, each suited to different use cases:

1. **Application Load Balancer (ALB)**

    - Designed for HTTP and HTTPS traffic.
    - Operates at **Layer 7** (Application Layer) of the OSI model.
    - Features:
        - Content-based routing (e.g., route based on URL path or hostname).
        - WebSocket and HTTP/2 support.
        - Authentication using OIDC, Cognito, or other mechanisms.
        - Advanced request-routing capabilities (e.g., based on headers or query strings).
        - Integration with AWS Web Application Firewall (WAF).

2. **Network Load Balancer (NLB)**

    - Designed for **TCP, UDP, and TLS** traffic.
    - Operates at **Layer 4** (Transport Layer).
    - Features:
        - High-performance handling of millions of requests per second.
        - Static IP addresses or Elastic IPs for the load balancer.
        - Ability to preserve client source IP addresses.
        - Ideal for low-latency, high-throughput workloads.

3. **Gateway Load Balancer (GWLB)**

    - Designed for deploying and managing **third-party virtual appliances** (e.g., firewalls, monitoring tools).
    - Operates at **Layer 3** (Network Layer).
    - Features:
        - Scalable and elastic traffic distribution for appliances.
        - Integrates with Virtual Private Cloud (VPC) Ingress Routing.

4. **Classic Load Balancer (CLB)**
    - Legacy load balancer that supports **both Layer 4 and Layer 7 traffic**.
    - Limited features compared to ALB and NLB.
    - Features:
        - Basic routing and health checks.
        - Supports legacy applications.

### Key Components of an AWS Load Balancer

#### Listeners

A listener is a process configured on the load balancer to check for incoming client connection requests. It listens for connections using a specified protocol and port and forwards these requests to the appropriate targets based on the rules configured.

-   **Protocols Supported**:
    -   HTTP/HTTPS (Application Load Balancer)
    -   TCP/TLS/UDP (Network Load Balancer)
-   **Ports**:
    -   Common ports include **80** (HTTP) and **443** (HTTPS).
    -   You can define custom ports if needed.
-   **Rules**: Define how the load balancer routes traffic to different target groups.

    -   Criteria: Rules can be based on various criteria.
        -   Path: Route traffic based on the path of the incoming request (e.g., /api, /images).
        -   Host Header: Route traffic based on the host header in the request (e.g., www.example.com).
        -   HTTP Headers: Route traffic based on specific HTTP headers in the request.
        -   Query Parameters: Route traffic based on query parameters in the request URL.
    -   Example: In ALB, rules can include host-based routing (e.g., `www.example.com`) or path-based routing (e.g., `/api`).

-   **Use Cases**:
    -   For ALB: You can configure a listener to route traffic for multiple services running on different paths or domains.
    -   For NLB: Use listeners to route traffic at a network level for high-throughput applications.

#### Target Groups

A target group is a logical grouping of the targets that the load balancer routes traffic to. Targets can be **EC2 instances**, **IP addresses**, **containers (ECS tasks)**, or **AWS Lambda functions**.

-   **Types of Targets**:
    -   **Instances**: Routes traffic to specific EC2 instances.
    -   **IP Addresses**: Targets specific IP addresses. Useful for hybrid architectures.
    -   **Lambda Functions**: ALB supports invoking Lambda functions for serverless applications.
-   **Health Checks**:
    -   Automatically perform health checks on the targets to ensure only healthy ones receive traffic.
    -   Parameters include the protocol, ping path, interval, and thresholds.
-   **Routing**:

    -   You can associate multiple target groups with different listeners and rules to route traffic intelligently.

-   **Example**:
    -   A web app running on multiple EC2 instances can have a target group configured with all those instances.
    -   A microservices architecture could have separate target groups for APIs, user interfaces, and static content.

#### Load Balancer Nodes

Load balancer nodes are the actual physical or virtual machines that handle the traffic within AWS. They are managed by AWS and operate behind the scenes to distribute traffic effectively.

-   **Distributed Across AZs**:
    -   ELB automatically deploys load balancer nodes in multiple Availability Zones (AZs) for high availability and fault tolerance.
-   **Scaling**:
    -   Load balancer nodes automatically scale to handle increases in traffic.
    -   When traffic reduces, nodes are scaled down.
-   **Connection Handling**:

    -   These nodes terminate client connections and forward requests to the target.

-   **How It Works**:
    -   A DNS name (e.g., `my-load-balancer-12345.elb.amazonaws.com`) is provided by AWS.
    -   This name resolves to the IP addresses of the load balancer nodes.
    -   Clients connect to these nodes, which distribute the traffic to healthy targets.

#### Health Checks

Health checks are critical for ensuring that traffic is only sent to healthy targets. ELB continuously monitors the health of targets in a target group and routes traffic to only those that are healthy.

-   **Health Check Configuration**:
    -   **Protocol**: HTTP, HTTPS, TCP, or UDP.
    -   **Port**: The port on which the health check is performed.
    -   **Path**: The specific path for HTTP/HTTPS checks (e.g., `/healthcheck`).
-   **Interval and Timeout**:
    -   The interval defines how often the health check is performed.
    -   The timeout specifies the time allowed for the target to respond.
-   **Thresholds**:

    -   Healthy threshold: Number of consecutive successful responses required to mark the target as healthy.
    -   Unhealthy threshold: Number of consecutive failures required to mark the target as unhealthy.

-   **Example**:
    -   A target is considered healthy if it returns a `200 OK` HTTP response for 3 consecutive health check requests within the interval.

#### Security Groups

Security groups act as virtual firewalls that control inbound and outbound traffic for the load balancer.

-   **Inbound Rules**:
    -   Specify the type of traffic allowed to reach the load balancer (e.g., allow HTTP traffic on port 80 or HTTPS on port 443).
-   **Outbound Rules**:
    -   Define the type of traffic that the load balancer can send to targets.
-   **Granular Control**:

    -   You can restrict access to specific IP ranges, CIDR blocks, or other AWS resources.

-   **Example**:
    -   For an internet-facing ALB, configure a security group to allow public traffic on ports 80 and 443.
    -   For an internal-only NLB, restrict traffic to your VPC CIDR range.

#### Access Logs

Access logs provide detailed information about requests processed by the load balancer. These logs are invaluable for debugging, analyzing traffic patterns, and monitoring security.

-   **Stored in S3**:
    -   Logs are automatically saved in an S3 bucket that you specify.
-   **Log Contents**:
    -   Includes information like the request time, client IP, target details, response status, latency, and more.
-   **Analysis**:

    -   Can be analyzed using tools like Amazon Athena, AWS Glue, or third-party log analysis tools.

-   **Use Cases**:
    -   Troubleshoot issues with specific clients or requests.
    -   Monitor and analyze application performance.

#### Elastic IPs (NLB Only)

Elastic IPs (EIPs) are static IP addresses that can be assigned to the Network Load Balancer for predictable and consistent access.

-   **Static IPs**:
    -   NLB can assign Elastic IPs to its nodes in each AZ.
-   **Use Cases**:
    -   Simplifies DNS management when clients require fixed IPs.
    -   Useful for firewall configurations and hybrid environments.

#### DNS Name

AWS ELB provides a DNS name for each load balancer, which clients use to send requests. The DNS name is associated with the IPs of the load balancer nodes.

-   **Dynamic Resolution**:
    -   The DNS name resolves to the IP addresses of the load balancer nodes.
    -   AWS handles changes in the underlying infrastructure automatically.
-   **Example**:
    -   `my-load-balancer-12345.us-west-2.elb.amazonaws.com`.

#### Sticky Sessions (Session Affinity)

Sticky sessions ensure that requests from the same client are routed to the same target for the duration of the session.

-   **Session Duration**:
    -   Controlled by cookies (either AWS-generated or custom).
-   **Use Cases**:
    -   Applications that maintain session state (e.g., user login or shopping cart).

### Core Features and Concepts

1. **Health Checks**

    - Ensure that traffic is only routed to healthy targets.
    - Configurable parameters:
        - Protocol: HTTP, HTTPS, or TCP.
        - Path: The endpoint to check (e.g., `/health`).
        - Interval: Time between health checks.
        - Threshold: Number of consecutive failures or successes to mark a target as unhealthy or healthy.

2. **Sticky Sessions**

    - Also known as **session affinity**.
    - Ensures that requests from the same client are routed to the same target for the duration of the session.
    - Useful for applications that rely on session data stored locally on the target.

3. **Cross-Zone Load Balancing**

    - Distributes traffic evenly across all targets in all enabled AZs, regardless of the AZ in which the load balancer node resides.

4. **Host-Based and Path-Based Routing (ALB)**

    - Host-based routing: Route requests to different target groups based on the **Host** header (e.g., `api.example.com` vs. `app.example.com`).
    - Path-based routing: Route requests based on the URL path (e.g., `/api` vs. `/login`).

5. **SSL/TLS Termination**

    - Load balancers can terminate SSL/TLS connections, offloading the encryption and decryption process from the targets.
    - Managed using **AWS Certificate Manager (ACM)** or custom certificates.

6. **Static IPs and Elastic IPs**

    - NLB supports assigning **static IP addresses** or **Elastic IPs** for consistent access.

7. **WebSocket and HTTP/2 Support**
    - ALB supports **WebSocket** for real-time communication and **HTTP/2** for better performance.

</details>
