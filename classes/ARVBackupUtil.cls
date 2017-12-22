public class ARVBackupUtil{
    List<Object> backupObjects=null;
    static List<Object> completedBackups;
    List<Object> inprogressBackups;
    public static String SORT_BY ='backupId'; 
    public static Integer PAGE =1; 
    public static String SEARCH_KEY =''; 
    public static Boolean isAsc =true; // ASC or DESC
    public void setSearchFilters(String searchkey, String srtBy,Integer pagenum,Boolean isAscending){
        if(srtBy.equalsIgnoreCase('') || srtBy==null){
            SORT_BY ='backupId';
        }
        else{
        SORT_BY=srtBy;
        }        
        if(searchkey.equalsIgnoreCase('') || searchkey==null){
            SEARCH_KEY ='';
        }
        else{
        SEARCH_KEY=searchkey;
        }
        if(pagenum==null){
            PAGE =1;
        }
        else{
        PAGE=pagenum;
        }
        if(isAscending==null){
            isAsc=true;
        }
        else{
            isAsc=isAscending;
        }
    }
    public void setSort(String srtBy){
        if(srtBy.equalsIgnoreCase('') || srtBy==null){
            SORT_BY ='backupId';
        }
        else{
        SORT_BY=srtBy;
        }
    }
    public ARVBackupUtil(List<Object> backupObjects){
        this.backupObjects=backupObjects;
        completedBackups = new List<Object>();
        inprogressBackups= new List<Object>();
        divideBackups();
    }
    public void divideBackups(){
        if(backupObjects!=null)
        {
            for (Object i : backupObjects) {
              BackupInfo bi =(BackupInfo)(JSON.deserialize(JSON.serialize(i), BackupInfo.class));
              if(bi.objProcStatus.equalsIgnoreCase('COMPLETED')){
                 completedBackups.add((Object)bi);    
              }
              else{
                inprogressBackups.add((Object)bi);    
              }
            }
            completedBackups.sort();
        }
        else
        {
            System.debug('Backup objects list empty');
        }
    }
    @AuraEnabled
    public static List<Object> getListOfBackupsWithFilter(String sfOrgID, String sortBy){
        List<Object> s =(List<Object>)JSON.deserializeUntyped(JSON.serialize(completedBackups));
        return s;
    }
    public List<Object> getCompletedBackups(Integer pageNumber){
        return completedBackups;
    }
    public List<Object> getInProgressBackups(Integer pageNumber){
        return inprogressBackups;
    }
    public class BackupInfo implements Comparable {
            public Integer backupId;        
            public String idCfgBakup;
            public String bkpLabel;
            public String objProcStatus;
            public String liveStatus;
            public String flBakupTyp;
            public String idUser;
            public Integer strTotDuration;
            public Integer nbrTotApi;
            public Integer nbrTotRecords;
            public Integer successCount;
            public Long tmStamp;
            public Integer compareTo(Object obj){
                BackupInfo bi = (BackupInfo)(obj);
                if (ARVBackupUtil.SORT_BY.equalsIgnoreCase('backupId')) {
                    return sortById(bi);
                }
                if (ARVBackupUtil.SORT_BY.equalsIgnoreCase('bkpLabel')) {
                    return sortByLabel(bi);
                }
                return 1;
            }
            private Integer sortById(BackupInfo bi){
                    if(this.backupId==null ||  bi.backupId==null)
                    {
                         return -1;
                    }
                    if (this.backupId > bi.backupId) {
                        return 1;
                    }
                    if (this.backupId == bi.backupId) {
                        return 0;
                    }
                    return -1;
            }
            private Integer sortByLabel(BackupInfo bi){
                    if(this.bkpLabel==null ||  bi.bkpLabel==null)
                    {
                         return -1;
                    }
                    if (this.bkpLabel > bi.bkpLabel) {
                        return 1;
                    }
                    if (this.bkpLabel == bi.bkpLabel) {
                        return 0;
                    }
                    return -1;
            }
    }    
}