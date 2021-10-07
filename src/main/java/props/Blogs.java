package props;

import java.sql.PreparedStatement;
import java.util.Date;

public class Blogs {

    private int bid;
    private String title;
    private String detail;
    private Date date;

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Blogs(int bid, String title, String detail, Date date) {
        this.bid = bid;
        this.title = title;
        this.detail = detail;
        this.date =date;
    }
    public Blogs(){

    }

    public int getBid() {
        return bid;
    }

    public void setBid(int bid) {
        this.bid = bid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }
}
