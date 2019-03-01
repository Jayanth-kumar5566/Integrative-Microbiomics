import smtplib
from email.mime.text import MIMEText

def send(msg):
        msg=MIMEText(msg)
        msg["Subject"]="Output Notification"
        msg["From"]="Your Computer"
        s=smtplib.SMTP('smtp.gmail.com',587)
        s.starttls()
        s.login("jayanth.computer.output@gmail.com","123jaya***")
        s.sendmail('jayanth.computer.output@gmail.com','jayanth.kumar@students.iiserpune.ac.in',msg.as_string())
        s.quit()
        return None

send("Done GBLM")
