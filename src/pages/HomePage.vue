<template>
  <div class="pt-20 px-4 bg-white min-h-screen">
    <h2 class="text-3xl font-bold mb-6 text-center">
      Pack your bags, adventure awaits!
    </h2>
    <SearchBar @updateResults="updateTrips" />
    
    <div v-if="isLoading" class="text-center text-gray-500 mt-12">
      <p>กำลังโหลดข้อมูลทริป...</p>
    </div>
    
    <div v-else-if="error" class="text-center text-red-600 mt-12">
      <p>{{ error }}</p>
      <button 
        @click="fetchTrips" 
        class="mt-4 px-4 py-2 bg-blue-200 text-black rounded-lg hover:bg-blue-300"
      >
        ลองอีกครั้ง
      </button>
    </div>
    
    <Trips v-else :trips="tripsToShow" />
  </div>
</template>

<script lang="ts" setup>
import { ref, onMounted } from "vue";
import SearchBar from "../components/SearchBar.vue";
import Trips from "../components/Trips.vue";
import { api } from "../api.ts";
import type { Trip } from "../types/trip";

const allTrips = ref<Trip[]>([]);
const tripsToShow = ref<Trip[]>([]);
const isLoading = ref(false);
const error = ref("");

const fetchTrips = async () => {
  isLoading.value = true;
  error.value = "";
  try {
    console.log("Fetching trips from:", api.defaults.baseURL);
    
    // ลองหลาย endpoint ที่เป็นไปได้ (เรียงตามความน่าจะเป็น)
    const endpoints = ["/api/trips", "/trips", "/api/v1/trips"];
    let response = null;
    let lastError = null;
    
    for (const endpoint of endpoints) {
      try {
        console.log(`Trying endpoint: ${endpoint}`);
        response = await api.get<Trip[]>(endpoint);
        console.log(`Success with endpoint: ${endpoint}`);
        console.log("Trips received:", response.data);
        break;
      } catch (err: any) {
        console.log(`Failed with endpoint ${endpoint}:`, err.response?.status);
        lastError = err;
        // ถ้าไม่ใช่ 404 หรือ 403 ให้หยุดลอง endpoint อื่น
        if (err.response?.status && err.response.status !== 404 && err.response.status !== 403) {
          break;
        }
      }
    }
    
    if (response && response.data) {
      allTrips.value = response.data.sort(
        (a, b) =>
          new Date(b.createdAt).getTime() - new Date(a.createdAt).getTime()
      );
      tripsToShow.value = allTrips.value;
    } else {
      throw lastError || new Error("No response from any endpoint");
    }
  } catch (err: any) {
    console.error("Error fetching trips:", err);
    console.error("Error response:", err.response);
    console.error("Error status:", err.response?.status);
    console.error("Error data:", err.response?.data);
    console.error("Error headers:", err.response?.headers);
    
    if (err.response?.status === 403) {
      error.value = "403 Forbidden: Backend ปฏิเสธการเข้าถึง. อาจเป็นปัญหา CORS หรือ endpoint ต้องการ authentication. กรุณาตรวจสอบ:\n1. Backend CORS configuration\n2. API endpoint path\n3. Authentication requirements";
    } else if (err.response?.status === 404) {
      error.value = "404 Not Found: ไม่พบ endpoint. ลองตรวจสอบว่า backend ใช้ path อะไร (เช่น /api/trips, /api/v1/trips)";
    } else if (err.response?.status === 500) {
      error.value = "500 Server Error: มีปัญหาใน backend server.";
    } else if (err.code === "ERR_NETWORK" || err.message.includes("Network")) {
      error.value = "Network Error: ไม่สามารถเชื่อมต่อกับ backend ได้. กรุณาตรวจสอบว่า backend ทำงานอยู่ที่ https://travelappdb.onrender.com";
    } else {
      error.value = err.response?.data?.message || err.message || "ไม่สามารถโหลดข้อมูลทริปได้";
    }
  } finally {
    isLoading.value = false;
  }
};

const updateTrips = (results: Trip[]) => {
  tripsToShow.value = results;
};

onMounted(() => {
  fetchTrips();
});
</script>
