Now we're going to move to the module for creating and administering pluggable databases. In this first chapter, they're going to talk about creating a pluggable database from the Seed PDB. But before we can go there, we kind of need to get a good understanding of what is a pluggable database.

Then once we have an understanding of what is a pluggable database, we'll talk about the different methods that we can create these pluggable databases and then set it up to make sure the operation and everything is working properly. First, let's go to the picture that I had for our container database.

So now, as we can see, a container database consists of your regular database component, which is the main database, and the files that are required for the database to operate. And all of the files in the main database are shared by all the pluggable databases.

So here I have the control file. This control file actually gives me the specifications and all of the structural informational items about not just my container, but also my PDBs. Each of these pluggable databases in the control file will be assigned a DBID. Therefore, Oracle Database can track them, manage them, and perform all of the executions or operations based on that PDB's DBID.

Like when we collect statistics to see how the performance is going, we need to use that DBID to collect the statistics for the right PDB and then review the statistics handed to other tools to give us assistance in understanding what that would look like. So these pluggable databases all have information in that control file and they share the same control file from the container.

The redolog file-- the same thing. These redolog files are shared. Transactions redo from all sessions for all of the different connections for these pluggable database services-- all go to the same redo. Except, in the redo, there is specific information based on where the data is coming from-- which redo belongs to which PDB.

Therefore, in our 12.2 and up releases of the container database-- because of that identification of the redo, we can only replicate one PDB. We can perform flashback only on one PDB. Of course, another thing that was required to do that we'll talk about in a little bit is the local-undo.

Anyway, so the redo is shared. And all the redos from all the PDBs are mixed in the same files. And then the data files of the container-- this data file of the container has, of course, your main data dictionary, the main historic location-- that all of the databases load. Everything that this container does is restored in there.

And within that same specification also exists specifications about where these PDBs are, their name, configurational information, and all of that. OK? Now originally when container database came out into 12.1, undo was a functionality of the container. And all the PDBs shared the same undo tablespace at the CDB level, at the container level.

This created a lot of restriction for PDBs to operate independently. We couldn't independently back up a PDB by connecting to PDB, backing it up hot. Because now we have dependency on the CDB and how the CDB undo is actually operating. In 12.2 and up, we can have undo now converted to a local management.

Once you set up the CDB to manage undo locally, then there is an automatic undo segments or table spaces created for the PDBs that the undo is then maintained within that Oracle-managed undo for the pluggable database.

By having this undo within that pluggable database-- so now, as we said, we can flashback this pluggable database on its own, we can replicate it, we can connect to the PDB service, and just backup this pluggable database. And we'd be able to restore it to the same CDB or any other CDBs depending on the release-- maybe a new CDB already-- a CDB that is in use.

So this local-undo allowed us a lot of different capabilities. That's why we generally recommend to have this local-undo enabled. To enable this local-undo you have to start the instance in an upgrade mode, change the undo to shared, and then shut down and start up in a normal format. And then the undo will be built for all the PDBs.

Now all of this information from the CDB is shared by all the PDBs and has all of these global configurations in it. The instance-- this is where all of the sessions connect and all the PDBs share the same instance. Therefore, in a container database with multi-tenant, we have capability in 12.2 and up to divide this SGA, divide our PGAs within the PDBs.

So this way, if one PDB has a runaway query, has a process that needs a lot of resources, that PDB does not impose on other PDBs and take resources from other PDBs. This way PDBs' performance operations can be specifically configured and set to guarantee a similar type of operation.

Now when you create this container database, a PDB seed is required. This PDB seed is a template that we can use to create empty PDBs from. And to Oracle, this is a requirement for a container database. Regardless of how you create the container, the CDB, the seed must be created.

Seed generally has the configuration for your system, sysops, temp. OK? So the general structure for a PDB-- but of course, there is nothing in it. It is an empty PDB. This PDB seed will automatically open when the CDB opens in a read only mode. And then we can only use it for duplication to create an empty PDB.

Oracle, for many reasons, has required this PDB seed to always exist. So we cannot get rid of it even if I am not planning on using it for duplication.

Other PDBs-- we will create these other PDBs as needed for our application, for serving clients, depending on all of the requirements for a particular client. Then we want to make sure all of those information is within the same PDB because these pluggable databases, in a way-- everything in it is locked up.

If you connect to this PDB service you cannot query data from another PDB. If you connect to the CDB, you cannot query the user data in the PDB. You can only query the metadata because that's considered to be shared. But the actual user data cannot be accessed that way. This is done for security purposes.

If I do want one PDB data to be accessed by another PDB, we have to put DB link between them. That's why it's important for us to make sure all of the required information for a particular application is enclosed within that same PDB. Now you can create the PDB from scratch by using SQL and then identify exactly where these files are going to be put.

You can create a PDB by duplicating seed and by using file name convert to say, OK, my PDB seed files are located at this path. I want you to convert this file to something different. And then put my pdb_hr files over there.

Or you can clone an existing PDB. Then I have a PDB like here, pdb_hr. I can clone this pdb_hr and create a duplicate of this, including everything that's in it, the data files, and everything else. So we can replicate the PDB to another.

And if we have a non-container database, we can create an empty PDB either by SQL or PDB seed. Once we create that empty PDB, then we can export that off a non-container imported into pluggable database. Or we can take a non-container, we can convert a non-container into a PDB, and then plug it in.

Remember, a non-container can never become a CDB because CDB is a shell and must be built brand new. All right, so the next thing we need to define is temporary operation, generally temporary operation managed locally within each PDB.

If you create a PDB by hand using SQL, you can actually not define a local temp and use a shared temp from the CDB. Of course, not a good recommendation as far as how it should be set up. You usually want them to be separated.

However, if you do separate them, you can never go back to shared anymore. Very good. Then the rest of the configuration, the rest of the set up, is exactly the same as our regular database. We have one primary file for that instance. Password file will be created for my instance.

Now depending on the release of database, you can use shared password file, you can use dedicated password file for each PDB-- excuse me. Password file is for the instance for the CDB. It's the wallet that you can use-- dedicated one for PDB.

So when it comes to wallet, wallets are used for transparent encryption master key, holding certificate, user ID password. You can have shared wallet, user of the shared key for transparent encryption, or dedicated wallet word for each PDB that stores their own key within that particular PDB.

Then your archive. Archive is an instance. Functionality is a copy of the redo. Therefore, archiving also includes all the PDB transaction changes in the same archives.

And on the client side, when they connect, they connect the same way to Oracle Net except in this configuration, the clients would not connect to my instance with the instance name. Because if they connect to my instance name, they can't get any data from the PDB. So the client generally must connect under the PDB service name.

Once they connect under the PDB service name, then they can locally now select from the data that is within that PDB. So when you create a new PDB, Oracle will automatically create a service with the name of that PDB and enable that service in the CDB. And then if you need to, you can connect to PDB to create some additional internal services for PDB to better manage connections coming to the PDBs.

Now most important aspect about this application container-- number one, I can reduce the number of instances that they're managing by consolidating applications into one container. That doesn't mean I can use one of those instances I used to have and now put all of my data from five different databases into that one instance.

That instance will be exhausted. If you are consolidating, you do need to beef up that instance to now manage the consolidated connections that are required for all the PDBs in that container database.

However, you would only have one instance to manage. There is only one set of background processes that are running on that host. Although, I'd need more resources on reducing some of the Oracle footprint.

Very good. So here you can see a configuration of this container database. Over here on the right side we can take a pluggable database and partition the whole schema that is in pluggable database. And using that common partitioning, divide that pluggable database into sub PDBs.

Now each partition can be served by a PDB of its own. And many times, as we mentioned a little bit earlier, we can use a proxy. And the proxy can then point to a PDB that is stored on a different CDB.

So through this proxy, this remote PDB will act as if this was exactly part of this application container within this CDC itself. So this way I can actually place a partition of the data closer to the users that use the data.

For example, let's say I am a global company. I can now put my Asian data in a PDB-- in a database, a container database, that is in Tokyo. I have another partition and another CDB in Australia. I have another one in Europe. I have another one in the US. And guess what? All of those different CDBs are part of a single application container globally.

So I can connect to any of those CDBs. Say select asterisk on table. I can read data globally across all of those different CDBs through these proxies, totally invisible to the code. So that's where we're going with the pluggable databases.

We are getting now to distributed data execution. Why? Too big. And when things get too big, divide and conquer. Divide them into pieces, have each piece managed by a particular server and its own resources so it's better configurable.

Just look at many companies. You're a small company, you may have only two departments. Once the company starts making money and becomes bigger, two departments will not do it anymore. You've got to keep adding additional departments. You've got to keep separating workloads. That's basically what we do with an application container.

So this now gives you a quick overview of what a container database and PDBs are. Next thing we're going to do is, now we're going to go and talk about how do we create some of these PDBs and, as we said in our first chapter, we're going to be looking at creating these PDBs from seed.