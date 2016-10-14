package com.apress.usermanager.support;

import static java.lang.String.format;
import static org.apache.commons.io.IOUtils.closeQuietly;

import java.io.InputStream;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import javax.sql.DataSource;

import org.apache.log4j.Logger;
import org.dbunit.database.DatabaseConnection;
import org.dbunit.database.IDatabaseConnection;
import org.dbunit.dataset.DefaultDataSet;
import org.dbunit.dataset.IDataSet;
import org.dbunit.dataset.ITable;
import org.dbunit.dataset.ITableIterator;
import org.dbunit.dataset.xml.XmlDataSet;
import org.dbunit.operation.DatabaseOperation;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.core.io.Resource;
import org.springframework.jdbc.datasource.DataSourceUtils;
/**
 * Imports the default static data into the given dataSource.
 * Uses dbunit to perform inserts.
 *
 * @author filippo
 */
public class StaticDataImporter implements InitializingBean {

   // statics ***************************************************************

   private static final Logger LOGGER = Logger.getLogger(StaticDataImporter.class);

   // fields ****************************************************************

   private DataSource dataSource ;

   private Resource staticData ;

   /* single use executor, will be shutdown after run */
   private ExecutorService executor = Executors.newSingleThreadExecutor();

   // public methods ********************************************************

   public void afterPropertiesSet() throws Exception {
      executor.execute(new Runnable(){
         public void run() {
            try{
               performStaticImport();
            } finally {
               executor.shutdown();
            }
         }
      });
   }

   // private methods *******************************************************

   private void performStaticImport(){
      Connection connection = DataSourceUtils.getConnection(dataSource);
      try{
         IDatabaseConnection dbunitConnection = new DatabaseConnection(connection);
         IDataSet dataSet = readDataSet();
         ITableIterator iter = dataSet.iterator() ;

         while(iter.next()){
            ITable table = iter.getTable();
            String tableName = table.getTableMetaData().getTableName();
            if( isEmpty(dbunitConnection, table) ){
               LOGGER.info(format("Importing static data for table :'%s'", tableName));
               DatabaseOperation.INSERT.execute(dbunitConnection, new DefaultDataSet(table));
            }else{
               LOGGER.debug(format("Skipping :'%s'", tableName));
            }
         }
      } catch(Exception e){
         LOGGER.warn("Exception caught in performStaticImport ... ignoring", e);
      }finally{
         DataSourceUtils.releaseConnection(connection, dataSource);
      }
      LOGGER.info("performStaticImport finished");
   }


   private boolean isEmpty(IDatabaseConnection dbunitConnection, ITable table) throws SQLException {
      return dbunitConnection.getRowCount(table.getTableMetaData().getTableName()) == 0 ;
   }


   private IDataSet readDataSet() throws Exception {
      InputStream is = null ;
      try {
         is = staticData.getInputStream();
         return new XmlDataSet(new InputStreamReader(is, "UTF-8"));
      } finally {
         closeQuietly(is);
      }
   }


   public void setDataSource(DataSource dataSource) {
      this.dataSource = dataSource;
   }


   public void setStaticData(Resource staticData) {
      this.staticData = staticData;
   }

}
