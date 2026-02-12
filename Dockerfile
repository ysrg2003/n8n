# 1. ابدأ من النسخة الرسمية والمستقرة لـ n8n
FROM docker.n8n.io/n8nio/n8n:latest

# 2. انتقل لصلاحيات المدير لضبط الإعدادات
USER root

# 3. اضبط المنفذ الإجباري لموقع Hugging Face
ENV N8N_PORT=7860

# 4. ضع مفتاح تشفير ثابت لتجنب خطأ "لم يتم العثور على مفتاح"
ENV N8N_ENCRYPTION_KEY='aSecretKeyYouCanChangeLater_12345'

# 5. أنشئ مجلد البيانات وأعطِ الصلاحيات للمستخدم الصحيح (node)
RUN mkdir -p /home/node/.n8n && chown -R node:node /home/node/.n8n

# 6. عد للمستخدم العادي (node) لتشغيل البرنامج بأمان
USER node

# 7. ابدأ تشغيل n8n
CMD ["n8n", "start"]
