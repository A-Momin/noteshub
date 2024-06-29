


install_java_hadoop(){
     
    # Update and upgrade the Ubunto Machine:
    sudo apt-get update && sudo apt-get dist-upgrade    
    
    # Install OpenJDK:
    sudo apt install openjdk-11-jre-headless
    
    # Download Hadoop from one of these mirrors. Change the version number appropriately:
    wget https://dlcdn.apache.org/hadoop/common/hadoop-3.2.2/hadoop-3.2.2.tar.gz -P ~/
    
    # Extract it to /usr/local and rename to hadoop:
    sudo tar zxvf ~/hadoop-* -C /usr/local
    sudo rm -rf ~/hadoop-*
    sudo mv /usr/local/hadoop-* /usr/local/hadoop


    # Add Environment variables into ~/.bashrc
    cat env_var.txt >> ~/.bashrc

    sudo chmod 664 /usr/local/hadoop/etc/hadoop/hadoop-env.sh
    head -2 env_var.txt >> /usr/local/hadoop/etc/hadoop/hadoop-env.sh

}

name_node_operations(){
    cat ./hosts_list >> /etc/hosts

    file1=$HADOOP_CONF_DIR/hdfs-site.xml
    
    ##################### Edit hdfs-site.xml ##########################
    pat1="
    <configuration>
        <property>
            <name>dfs.replication</name>
            <value>3</value>
        </property>
        <property>
            <name>dfs.namenode.name.dir</name>
            <value>file:///usr/local/hadoop/data/hdfs/namenode</value>
        </property>
    </configuration>"
    
    sed "s/$pat1/$val1" $file1

    sudo mkdir -p $HADOOP_HOME/data/hdfs/namenode

    # Next, you’ll create the masters file in HADOOP_CONF_DIR. The masters file sets which machine the secondary namenode runs on. In your case, you'll have the secondary NameNode run on the same machine as the NameNode, so edit masters, add the hostname of NameNode (Note: Not the public hostname, but the hostname you get from $ hostname). Typically though, you would have the secondary NameNode run on a different machine than the primary NameNode.
    # Next, edit the slaves file in HADOOP_CONF_DIR, this file sets the machines that are DataNodes. In slaves, add the hostnames of each datanode (Note: Again, not the public hostname, but $ hostname hostnames). The slaves file might already contain a line localhost, you should remove it, otherwise the NameNode would run as a DataNode too. It should look like this:
        # datanode1_hostname
        # datanode2_hostname
        # datanode3_hostname

    sudo chown -R ubuntu $HADOOP_HOME

}

datanode_operations(){
    file1=$HADOOP_CONF_DIR/hdfs-site.xml
    
    ##################### Edit hdfs-site.xml ##########################
    pat1="
    <configuration>
        <property>
            <name>dfs.replication</name>
            <value>3</value>
        </property>
        <property>
            <name>dfs.datanode.data.dir</name>
            <value>file:///usr/local/hadoop/data/hdfs/datanode</value>
        </property>
    </configuration>"
    
    sed "s/$pat1/$val1" $file1

    sudo mkdir -p $HADOOP_HOME/data/hdfs/datanode
    sudo chown -R ubuntu $HADOOP_HOME
}

each_node_operations(){
    # $n: namenode_public_hostname

    file1=$HADOOP_CONF_DIR/core-site.xml
    file2=$HADOOP_CONF_DIR/yarn-site.xml
    file3=$HADOOP_CONF_DIR/mapred-site.xml
    
    ##################### Edit core-site.xml ##########################
    pattern1="
    <configuration>
        <property>
            <name>fs.defaultFS</name>
            <value>hdfs://namenode_public_hostname:9000</value>
        </property>
    </configuration>"

    val1="
    <configuration>
        <property>
            <name>fs.defaultFS</name>
            <value>hdfs://$1:9000</value>
        </property>
    </configuration>"
    
    sed "s/$pat1/$val1" $file1

    #################### Edit yarn-site.xml ############################
    pat2="
    <configuration>
        <property>
            <name>yarn.nodemanager.aux-services</name>
            <value>mapreduce_shuffle</value>
        </property>
        <property>
            <name>yarn.resourcemanager.hostname</name>
            <value>namenode_public_hostname</value>
        </property>
    </configuration>"
    
    val2="
    <configuration>    
        <property>
            <name>yarn.nodemanager.aux-services</name>
            <value>mapreduce_shuffle</value>
        </property>
        <property>
            <name>yarn.resourcemanager.hostname</name>
            <value>$2</value>
        </property>
    </configuration>"

    sed "s/$pat2/$val2" $file2


    #################### Edit mapred-site.xml ##########################
    sudo cp $HADOOP_CONF_DIR/mapred-site.xml.template file3
    val3="
    <configuration>
        <property>
            <name>mapreduce.jobtracker.address</name>
            <value>$3:54311</value>
        </property>
        <property>
            <name>mapreduce.framework.name</name>
            <value>yarn</value>
        </property>
    </configuration>"

    echo $val3 >> $file3
}

scp_local_machine_namenode(){
    scp ~/file_path_______________/config namenode:~/.ssh
    scp ~/.ssh/rsa_id.pub namenode:~/.ssh

}

dist_sshkeys_to_datanodes(){
    # Distribute generated public key from namenode to datanode
    # From the Name Node Operations:
    # create a public key and copy it into authorized_keys: (remember $ ssh namenode)
    ssh-keygen -f ~/.ssh/id_rsa -t rsa -P ""
    cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
    
    
    # Copy authorized_keys to each DataNode to enable passwordless login.
    ssh datanode1 'cat >> ~/.ssh/authorized_keys' < ~/.ssh/id_rsa.pub
    ssh datanode2 'cat >> ~/.ssh/authorized_keys' < ~/.ssh/id_rsa.pub
    ssh datanode3 'cat >> ~/.ssh/authorized_keys' < ~/.ssh/id_rsa.pub
}

