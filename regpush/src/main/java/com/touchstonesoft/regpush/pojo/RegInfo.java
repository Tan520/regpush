package com.touchstonesoft.regpush.pojo;

import java.sql.Timestamp;

public class RegInfo {

    private String CSTUDYID;
    private Timestamp CBESPEAKTIME;
    private int CQUEUENO;
    private String CCHECKSERIALNUM;
    private String CDEVICEID;
    private String CDEVICENAME;
    private String CSIMPLECODE;
    private String CDIAGID;
    private Timestamp COPERATETIME;
    private String CDEVICETYPENAME;

    public String getCSTUDYID() {
        return CSTUDYID;
    }

    public void setCSTUDYID(String CSTUDYID) {
        this.CSTUDYID = CSTUDYID;
    }

    public Timestamp getCBESPEAKTIME() {
        return CBESPEAKTIME;
    }

    public void setCBESPEAKTIME(Timestamp CBESPEAKTIME) {
        this.CBESPEAKTIME = CBESPEAKTIME;
    }

    public int getCQUEUENO() {
        return CQUEUENO;
    }

    public void setCQUEUENO(int CQUEUENO) {
        this.CQUEUENO = CQUEUENO;
    }

    public String getCCHECKSERIALNUM() {
        return CCHECKSERIALNUM;
    }

    public void setCCHECKSERIALNUM(String CCHECKSERIALNUM) {
        this.CCHECKSERIALNUM = CCHECKSERIALNUM;
    }

    public String getCDEVICEID() {
        return CDEVICEID;
    }

    public void setCDEVICEID(String CDEVICEID) {
        this.CDEVICEID = CDEVICEID;
    }

    public String getCDEVICENAME() {
        return CDEVICENAME;
    }

    public void setCDEVICENAME(String CDEVICENAME) {
        this.CDEVICENAME = CDEVICENAME;
    }

    public String getCSIMPLECODE() {
        return CSIMPLECODE;
    }

    public void setCSIMPLECODE(String CSIMPLECODE) {
        this.CSIMPLECODE = CSIMPLECODE;
    }

    public String getCDIAGID() {
        return CDIAGID;
    }

    public void setCDIAGID(String CDIAGID) {
        this.CDIAGID = CDIAGID;
    }

    public Timestamp getCOPERATETIME() {
        return COPERATETIME;
    }

    public void setCOPERATETIME(Timestamp COPERATETIME) {
        this.COPERATETIME = COPERATETIME;
    }

    public String getCDEVICETYPENAME() {
        return CDEVICETYPENAME;
    }

    public void setCDEVICETYPENAME(String CDEVICETYPENAME) {
        this.CDEVICETYPENAME = CDEVICETYPENAME;
    }
}
