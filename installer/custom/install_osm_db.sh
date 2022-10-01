export OSM_DIR=/data/osm
export DB_DIR=${OSM_DIR}/db
export GZ_MAP_FILE_NAME=db.tar.gz
export GZ_MAP_FILE=${OSM_DIR}/${GZ_MAP_FILE_NAME}

# Remove legacy compressed map file if existing
rm -rf $GZ_MAP_FILE

# WD
cd $OSM_DIR

# Download map file
#wget https://opkr.tk/osm/db/kor/${GZ_MAP_FILE_NAME}

#if [ "$?" != 0 ]; then
  #echo "Error downloading map file"
#else
  echo "Successfuly downloaded map file"
  # Remove current db dir if exisiting
  rm -rf $DB_DIR
  # Uncompress
  #tar -zxvf db.tar.gz
  sudo apt -y install osmctools
  osmconvert --out-osm georgia-latest.osm.pbf | ~/osm/osm-3s_v0.7.56/bin/update_database --meta --db-dir="/home/data/osm/db/"
  # Remove compressed map files after expanding
  rm -rf $GZ_MAP_FILE
fi
