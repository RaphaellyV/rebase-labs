require 'csv'

class Tests
  def initialize
    @conn = PG.connect(host: 'postgres', dbname: 'postgres', user: 'postgres')
  end

  def import_csv(file)
    rows = CSV.read(file, col_sep: ';')
    rows.delete_at(0)
    rows.each do |row|
      @conn.exec("INSERT INTO TESTS (PATIENT_REGISTRATION_NUMBER, PATIENT_NAME, PATIENT_EMAIL,
                                    PATIENT_BIRTH_DATE, PATIENT_ADDRESS, PATIENT_CITY,
                                    PATIENT_STATE, DOCTOR_CRM, DOCTOR_CRM_STATE, DOCTOR_NAME,
                                    DOCTOR_EMAIL, TEST_TOKEN, TEST_DATE, TEST_TYPE, TEST_LIMITS,
                                    TEST_RESULT)
                  VALUES ('#{(row[0])}', '#{row[1]}', '#{row[2]}', '#{row[3]}', '#{row[4]}',
                          '#{@conn.escape_string(row[5])}','#{row[6]}', '#{row[7]}', '#{row[8]}', '#{row[9]}',
                          '#{row[10]}', '#{row[11]}', '#{row[12]}', '#{row[13]}',
                          '#{row[14]}', '#{row[15]}')")
    end
  end
end