package banhaisan.models.datamodels;

import java.util.Date;

public class DanhGia {
    private String maDanhGia;
    private int danhGia;
    private String binhLuan;
    private Date ngayBinhLuan;
    private String maNguoiDung;
    private String tenNguoiDung;
    private String maSP;

    public DanhGia(String maDanhGia, int danhGia, String binhLuan, Date ngayBinhLuan, String maNguoiDung, String tenNguoiDung, String maSP) {
        this.maDanhGia = maDanhGia;
        this.danhGia = danhGia;
        this.binhLuan = binhLuan;
        this.ngayBinhLuan = ngayBinhLuan;
        this.maNguoiDung = maNguoiDung;
        this.tenNguoiDung = tenNguoiDung;
        this.maSP = maSP;
    }

    public DanhGia(){}

    public String getTenNguoiDung() {
        return tenNguoiDung;
    }

    public void setTenNguoiDung(String tenNguoiDung) {
        this.tenNguoiDung = tenNguoiDung;
    }

    public String getMaDanhGia() {
        return maDanhGia;
    }

    public void setMaDanhGia(String maDanhGia) {
        this.maDanhGia = maDanhGia;
    }

    public int getDanhGia() {
        return danhGia;
    }

    public void setDanhGia(int danhGia) {
        this.danhGia = danhGia;
    }

    public String getBinhLuan() {
        return binhLuan;
    }

    public void setBinhLuan(String binhLuan) {
        this.binhLuan = binhLuan;
    }

    public Date getNgayBinhLuan() {
        return ngayBinhLuan;
    }

    public void setNgayBinhLuan(Date ngayBinhLuan) {
        this.ngayBinhLuan = ngayBinhLuan;
    }

    public String getMaNguoiDung() {
        return maNguoiDung;
    }

    public void setMaNguoiDung(String maNguoiDung) {
        this.maNguoiDung = maNguoiDung;
    }

    public String getMaSP() {
        return maSP;
    }

    public void setMaSP(String maSP) {
        this.maSP = maSP;
    }
}
