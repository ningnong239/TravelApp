import axios from "axios";

const baseURL = import.meta.env.VITE_BASE_URL || "https://travelappdb.onrender.com"; // ดึงจาก .env

if (!baseURL) {
  console.error("VITE_BASE_URL is not set in .env file");
}

console.log("API Base URL:", baseURL);

export const api = axios.create({
  baseURL,
  headers: {
    "Content-Type": "application/json",
    "Accept": "application/json",
  },
  withCredentials: false, // ปิด credentials สำหรับ CORS
});

// เพิ่ม request interceptor เพื่อส่ง token ใน header
api.interceptors.request.use(
  (config) => {
    const token = localStorage.getItem("token");
    if (token) {
      config.headers.Authorization = `Bearer ${token}`;
    }
    // Log request สำหรับ debugging
    console.log("API Request:", {
      method: config.method?.toUpperCase(),
      url: config.url,
      baseURL: config.baseURL,
      fullURL: `${config.baseURL}${config.url}`,
      headers: config.headers,
    });
    return config;
  },
  (error) => {
    return Promise.reject(error);
  }
);

// เพิ่ม response interceptor เพื่อจัดการ error
api.interceptors.response.use(
  (response) => response,
  (error) => {
    if (error.response?.status === 401) {
      // ถ้า token หมดอายุหรือไม่ถูกต้อง ให้ลบ token และ redirect ไปหน้า login
      localStorage.removeItem("token");
      localStorage.removeItem("user");
      if (window.location.pathname !== "/login") {
        window.location.href = "/login";
      }
    }
    return Promise.reject(error);
  }
);
