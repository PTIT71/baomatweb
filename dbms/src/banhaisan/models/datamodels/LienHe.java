package banhaisan.models.datamodels;

public class LienHe {
    private String maLienHe;
    private String tenNguoiDung;
    private String email;
    private String sdt;
    private String noiDung;

    public LienHe(String maLienHe, String tenNguoiDung, String email, String sdt, String noiDung) {
        this.maLienHe = maLienHe;
        this.tenNguoiDung = tenNguoiDung;
        this.email = email;
        this.sdt = sdt;
        this.noiDung = noiDung;
    }

    public LienHe(){}

    public String getMaLienHe() {
        return maLienHe;
    }

    public void setMaLienHe(String maLienHe) {
        this.maLienHe = maLienHe;
    }

    public String getTenNguoiDung() {
        return tenNguoiDung;
    }

    public void setTenNguoiDung(String tenNguoiDung) {
        this.tenNguoiDung = tenNguoiDung;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSdt() {
        return sdt;
    }

    public void setSdt(String sdt) {
        this.sdt = sdt;
    }

    public String getNoiDung() {
        return noiDung;
    }

    public void setNoiDung(String noiDung) {
        this.noiDung = noiDung;
    }
}
