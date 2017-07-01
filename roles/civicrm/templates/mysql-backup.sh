#!/bin/bash

BACKUP_DIR=/var/lib/mysql-backups
FILENAME={{ ansible_hostname }}-mysql-$(date +%Y%m%d-%H)

mkdir -p $BACKUP_DIR
mysqldump -u root --all-databases --single-transaction > $BACKUP_DIR/$FILENAME
tar -C $BACKUP_DIR -czf $BACKUP_DIR/$FILENAME.tar.gz $FILENAME && rm $BACKUP_DIR/$FILENAME
