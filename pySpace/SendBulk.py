import pandas as pd
import win32com.client as win32

# Path to the Excel file
excel_file = 'E:/SendBulk/SendBulkMail.xlsx'

# Load the Excel file into a pandas DataFrame
df = pd.read_excel(excel_file, dtype={'Email': str, 'Subject': str})

# Define the HTML content with sans-serif font and desired font size
content_html = """
<html>
  <head></head>
  <body style="font-family:sans-serif; font-size: 11pt;">
        <p>Dear Guest,</p>
        <p>We hope you enjoyed your recent stay at <b>Coorg Wilderness Resort &amp; Spa!</b> Your comfort and satisfaction are our top priorities, and we would greatly appreciate your feedback to help us enhance our services.</p>
        <p>To ensure we continue to meet and exceed your expectations, we kindly ask you to take a moment to fill out our brief <a href="https://forms.gle/sNf9yXVTj9fBr3Rr5">feedback form</a>. Your input will assist us in identifying areas for improvement and ensuring future guests have an exceptional experience.</p>
        <p>Your valuable feedback is instrumental in shaping the quality of our service, and we genuinely appreciate the time you take to share your thoughts with us.</p>
        <p>Thank you for choosing <b>Coorg Wilderness Resort &amp; Spa.</b> We look forward to welcoming you back soon!</p><br>
        <p>Warm regards,</p>
        <p>KARTHIK LAL<br></p>
        <p><b>IT Executive</b><br></p>
        <p><b>Paul John Resorts & Hotels Private Limited</b></p>
        <p>Kumarakom Lake Resort | Forte Kochi | The Paul Bangalore | Big Banyan Vineyard & Resort | Coorg Wilderness Resort & Spa <br></p>
        <p>Phone: +91 8129 62 4036 | Mobile: +91 6364 43 0600 <br></p>
        <p>Email: <a href="mailto:itcwr@thepaul.in"> itcwr@thepaul.in <a/> | Web: <a href="www.pauljohnhotels.com"> www.pauljohnhotels.com</a></p>
  </body>
</html>
"""

# Iterate over each row in the DataFrame
for index, row in df.iterrows():
    email = row['Email']
    subject = row['Subject']
    
    # Create an Outlook instance
    outlook = win32.Dispatch('Outlook.Application')
    
    # Create a new email
    mail = outlook.CreateItem(0)
    
    # Set the email properties
    mail.Subject = subject
    mail.HTMLBody = content_html
    mail.To = email
    
    try:
        # Send the email
        mail.Send()
        print(f"Email sent successfully to {email}")
    except Exception as e:
        print(f"Failed to send email to {email}: {e}")
