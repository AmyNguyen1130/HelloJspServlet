package manage;

import java.util.ArrayList;
import java.util.List;

import entity.Student;

public class ManageStudent {
	private static List<Student> students = new ArrayList();
	private static int idStudent = 1;

	public List<Student> getListStudent() {
		return students;
	}

	public void addToListStudent(String sName, String sClass, int sDob, String sLicenseCar) {
		Student student = new Student(sName, sClass, idStudent, sDob, sLicenseCar);
		students.add(student);
		idStudent++;
	}

	public void deleteFromListStudent(int sId) {
		for (int i = 0; i < students.size(); i++) {
			if (sId == students.get(i).getsId()) {
				students.remove(i);
			}
		}

	}

	public Student getStudent(int sId) {
		for(Student student : students) {
			if (sId == student.getsId()) {
				return student;
			}
		}

		return null;
	}

	public void editStudent(int sId, String sName, String sClass, int sDob, String sLicenseCar) {
		Student student = getStudent(sId);
		student.setsName(sName);
		student.setsClass(sClass);
		student.setsDoB(sDob);
		student.setsLincenseCar(sLicenseCar);
	}

}
