Variables:
in/0
  mnt - symbolic link to text file. use as primary mnt point
  
in/dd/
  src - device to pull from
        ex. if /dev/sda then dd's full parition
            if /dev/sda1 then copies single partition
            ./factor will strip out numbers and copy each parition individually
  des - folder to save image to
        uses relative path from primary mnt point
  mnt - symbolic link to in/0/mnt

in/sshfs
  src - username and ip to connect to
  des - dir to map to
  mnt - symbolic link to in/0/mnt
        will map to des
