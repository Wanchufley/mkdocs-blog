# How to Restore Data from Backups

Follow these steps to restore data from the backups we are generating:

1. Open **Portainer**, navigate to the **restic container**, and access its console.

2. Run the following command to list snapshots for a specific host:
   ```bash
   restic snapshots -H servarr

Replace servarr with your hostname. 

3. Identify the snapshot you want to use for restoring your containers and copy its ID. 

4. From the Docker host (in Proxmox), run the following command:
   ```bash
   docker exec restic restic restore --target /tmp-for-restore snapshot-id
   
Replace **snapshot-id** with the actual ID of the snapshot. 

5. After running the restore command, check the folder in your shared location where backups are stored. The restored data will be located inside /tmp-for-restore.