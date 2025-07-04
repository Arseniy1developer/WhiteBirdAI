import streamlit as st
import requests

st.set_page_config(page_title="WhiteBirdAI Chat", page_icon="🤖")

st.title("🤖 WhiteBirdAI Chat")

# Chat history
if "messages" not in st.session_state:
    st.session_state.messages = []

# Отображение истории
for msg in st.session_state.messages:
    with st.chat_message(msg["role"]):
        st.markdown(msg["content"])

# Ввод пользователя
prompt = st.chat_input("Спроси что-нибудь...")

if prompt:
    st.session_state.messages.append({"role": "user", "content": prompt})
    with st.chat_message("user"):
        st.markdown(prompt)

    with st.chat_message("assistant"):
        with st.spinner("Думаю..."):
            # Обращение к Together API
            response = requests.post(
                "https://api.together.xyz/v1/chat/completions",
                headers={
                    "Authorization": "Bearer YOUR_API_KEY",
                    "Content-Type": "application/json"
                },
                json={
                    "model": "mistralai/Mixtral-8x7B-Instruct-v0.1",
                    "messages": st.session_state.messages,
                    "temperature": 0.7
                }
            )
            reply = response.json()["choices"][0]["message"]["content"]
            st.markdown(reply)
            st.session_state.messages.append({"role": "assistant", "content": reply})
import streamlit as st
import requests

st.set_page_config(page_title="WhiteBirdAI Chat", page_icon="🤖")

st.title("🤖 WhiteBirdAI Chat")

# Chat history
if "messages" not in st.session_state:
    st.session_state.messages = []

# Отображение истории
for msg in st.session_state.messages:
    with st.chat_message(msg["role"]):
        st.markdown(msg["content"])

# Ввод пользователя
prompt = st.chat_input("Спроси что-нибудь...")

if prompt:
    st.session_state.messages.append({"role": "user", "content": prompt})
    with st.chat_message("user"):
        st.markdown(prompt)

    with st.chat_message("assistant"):
        with st.spinner("Думаю..."):
            # Обращение к Together API
            response = requests.post(
                "https://api.together.xyz/v1/chat/completions",
                headers={
                    "Authorization": "Bearer YOUR_API_KEY",
                    "Content-Type": "application/json"
                },
                json={
                    "model": "mistralai/Mixtral-8x7B-Instruct-v0.1",
                    "messages": st.session_state.messages,
                    "temperature": 0.7
                }
            )
            reply = response.json()["choices"][0]["message"]["content"]
            st.markdown(reply)
            st.session_state.messages.append({"role": "assistant", "content": reply})
