package entity;

public class Student {
	private String sName;
	private String sClass;
	private String sLicenseCar;
	private int sId;
	private int sDob;

	public Student(String sName, String sClass, int sId, int sDob, String sLicensecar) {
		this.sDob = sDob;
		this.sId = sId;
		this.sClass = sClass;
		this.sName = sName;
		this.sLicenseCar = sLicensecar;
	}

	public String getsClass() {
		return this.sClass;
	}

	public int getsDob() {
		return this.sDob;
	}

	public String getsLincenseCar() {
		return this.sLicenseCar;
	}

	public String getsName() {
		return this.sName;
	}

	public int getsId() {
		return this.sId;
	}

	public void setsClass(String sClass) {
		this.sClass = sClass;
	}

	public void setsDoB(int sDob) {
		this.sDob = sDob;
	}

	public void setsLincenseCar(String sLicenseCar) {
		this.sLicenseCar = sLicenseCar;
	}

	public void setsName(String sName) {
		this.sName = sName;
	}
}
