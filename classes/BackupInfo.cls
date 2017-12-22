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
        public static String SORT_BY ='backupId';
        public Integer nbrTotRecords;
        public Integer successCount;
        public Long tmStamp;
        public Integer compareTo(Object obj) 
        {
            BackupInfo bi = (BackupInfo)(obj);
            if (SORT_BY.equalsIgnoreCase('backupId')) {
                return sortById(bi);
            }
            if (SORT_BY.equalsIgnoreCase('bkpLabel')) {
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