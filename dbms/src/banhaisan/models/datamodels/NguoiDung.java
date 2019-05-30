package banhaisan.models.datamodels;

import java.sql.Date;

public class NguoiDung {
    private String maNguoiDung;
    private String email;
    private String matKhau;
    private String hoTen;
    private String diaChi;
    private String sdt;
    private Boolean gioiTinh;
    private Date ngaySinh;
    private Boolean admin;
    private Boolean kichHoat;

    public NguoiDung() {

    }

    public NguoiDung(String maNguoiDung, String email, String matKhau, String hoTen, String diaChi, String sdt, Boolean gioiTinh, Date ngaySinh, Boolean admin, Boolean kichHoat) {
        this.maNguoiDung = maNguoiDung;
        this.email = email;
        this.matKhau = matKhau;
        this.hoTen = hoTen;
        this.diaChi = diaChi;
        this.sdt = sdt;
        this.gioiTinh = gioiTinh;
        this.ngaySinh = ngaySinh;
        this.admin = admin;
        this.kichHoat = kichHoat;
    }

    public String getMaNguoiDung() {
        return maNguoiDung;
    }

    public void setMaNguoiDung(String maNguoiDung) {
        this.maNguoiDung = maNguoiDung;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMatKhau() {
        return matKhau;
    }

    public void setMatKhau(String matKhau) {
        this.matKhau = matKhau;
    }

    public String getHoTen() {
        return hoTen;
    }

    public void setHoTen(String hoTen) {
        this.hoTen = hoTen;
    }

    public String getDiaChi() {
        return diaChi;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }

    public String getSdt() {
        return sdt;
    }

    public void setSdt(String sdt) {
        this.sdt = sdt;
    }

    public Boolean getGioiTinh() {
        return gioiTinh;
    }

    public void setGioiTinh(Boolean gioiTinh) {
        this.gioiTinh = gioiTinh;
    }

    public Date getNgaySinh() {
        return ngaySinh;
    }

    public void setNgaySinh(Date ngaySinh) {
        this.ngaySinh = ngaySinh;
    }

    public Boolean getAdmin() {
        return admin;
    }

    public void setAdmin(Boolean admin) {
        this.admin = admin;
    }

    public Boolean getKichHoat() {
        return kichHoat;
    }

    public void setKichHoat(Boolean kichHoat) {
        this.kichHoat = kichHoat;
    }
}