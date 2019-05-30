package banhaisan.models.datamodels;

import java.sql.Date;

public class DonHang extends DonHang_SanPham{
    private String maDonHang;
    private String diaChiGiaoHang;
    private String ghiChu;
    private boolean hinhThucThanhToan;
    private Date ngayDatHang;
    private String maNguoiDung;
    private double tongTien;
    private boolean tinhTrang;


    public DonHang(String maDonHang, String diaChiGiaoHang, String ghiChu, boolean hinhThucThanhToan, Date ngayDatHang, String maNguoiDung, double tongTien, boolean tinhTrang, String maSP, int soLuong, String tenSP) {
        this.maDonHang = maDonHang;
        this.diaChiGiaoHang = diaChiGiaoHang;
        this.ghiChu = ghiChu;
        this.hinhThucThanhToan = hinhThucThanhToan;
        this.ngayDatHang = ngayDatHang;
        this.maNguoiDung = maNguoiDung;
        this.tongTien = tongTien;
        this.tinhTrang = tinhTrang;
    }

    public DonHang() {  }

    public String getMaDonHang() {
        return maDonHang;
    }

    public void setMaDonHang(String maDonHang) {
        this.maDonHang = maDonHang;
    }

    public String getDiaChiGiaoHang() {
        return diaChiGiaoHang;
    }

    public void setDiaChiGiaoHang(String diaChiGiaoHang) {
        this.diaChiGiaoHang = diaChiGiaoHang;
    }

    public String getGhiChu() {
        return ghiChu;
    }

    public void setGhiChu(String ghiChu) {
        this.ghiChu = ghiChu;
    }

    public boolean isHinhThucThanhToan() {
        return hinhThucThanhToan;
    }

    public void setHinhThucThanhToan(boolean hinhThucThanhToan) {
        this.hinhThucThanhToan = hinhThucThanhToan;
    }

    public Date getNgayDatHang() {
        return ngayDatHang;
    }

    public void setNgayDatHang(Date ngayDatHang) {
        this.ngayDatHang = ngayDatHang;
    }

    public String getMaNguoiDung() {
        return maNguoiDung;
    }

    public void setMaNguoiDung(String maNguoiDung) {
        this.maNguoiDung = maNguoiDung;
    }

    public double getTongTien() {
        return tongTien;
    }

    public void setTongTien(double tongTien) {
        this.tongTien = tongTien;
    }

    public boolean getTinhTrang() {
        return tinhTrang;
    }

    public void setTinhTrang(boolean tinhTrang) {
        this.tinhTrang = tinhTrang;
    }
}
