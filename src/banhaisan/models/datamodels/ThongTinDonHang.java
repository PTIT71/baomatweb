package banhaisan.models.datamodels;

import java.util.Date;

public class ThongTinDonHang {
    private String maDonHang;
    private String tenKhachHang;
    private Date ngayDatHang;
    private String diaChiDonHang;
    private String mail;
    private String soDienThoai;
    private int giaTriDonHang;

    public String getMaDonHang() {
        return maDonHang;
    }

    public void setMaDonHang(String maDonHang) {
        this.maDonHang = maDonHang;
    }

    public String getTenKhachHang() {
        return tenKhachHang;
    }

    public void setTenKhachHang(String tenKhachHang) {
        this.tenKhachHang = tenKhachHang;
    }

    public Date getNgayDatHang() {
        return ngayDatHang;
    }

    public void setNgayDatHang(Date ngayDatHang) {
        this.ngayDatHang = ngayDatHang;
    }

    public String getDiaChiDonHang() {
        return diaChiDonHang;
    }

    public void setDiaChiDonHang(String diaChiDonHang) {
        this.diaChiDonHang = diaChiDonHang;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getSoDienThoai() {
        return soDienThoai;
    }

    public void setSoDienThoai(String soDienThoai) {
        this.soDienThoai = soDienThoai;
    }

    public int getGiaTriDonHang() {
        return giaTriDonHang;
    }

    public void setGiaTriDonHang(int giaTriDonHang) {
        this.giaTriDonHang = giaTriDonHang;
    }
}
