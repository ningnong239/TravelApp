<template>
  <form @submit.prevent="$emit('submit')" class="space-y-4">
    <!-- Display Name -->
    <div class="relative z-0 w-full mb-4 text-left">
      <label class="block text-black text-sm mb-1">
        Display Name
      </label>
      <input
        v-model="form.displayName"
        type="text"
        class="block w-full px-3 py-2 bg-gray-100 rounded-md text-black focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
        required
      />
    </div>

    <!-- Email -->
    <div class="relative z-0 w-full mb-4 text-left">
      <label class="block text-black text-sm mb-1 text-left">
        Email
      </label>
      <input
        v-model="form.email"
        type="email"
        class="block w-full px-3 py-2 bg-gray-100 rounded-md text-black focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
        required
      />
      <p v-if="errors.email" class="text-black text-xs mt-1">
        {{ errors.email }}
      </p>
    </div>

    <!-- Password -->
    <div class="relative z-0 w-full mb-4 text-left">
      <label class="block text-black text-sm mb-1">
        Password
      </label>
      <input
        v-model="form.password"
        type="password"
        class="block w-full px-3 py-2 bg-gray-100 rounded-md text-black focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
        required
      />
      <p v-if="errors.password" class="text-red-500 text-xs mt-1">
        {{ errors.password }}
      </p>
    </div>

    <!-- Confirm Password -->
    <div class="relative z-0 w-full mb-4 text-left">
      <label class="block text-black text-sm mb-1">
        Confirm Password
      </label>
      <input
        v-model="form.confirmPassword"
        type="password"
        class="block w-full px-3 py-2 bg-gray-100 rounded-md text-black focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
        required
      />
      <p v-if="errors.confirmPassword" class="text-red-500 text-xs mt-1">
        {{ errors.confirmPassword }}
      </p>
    </div>

    <!-- Submit Button -->
    <button
      class="w-full py-2 rounded-lg transition flex items-center justify-center text-black bg-green-100 hover:bg-green-300 disabled:bg-gray-400 disabled:cursor-not-allowed"
      :disabled="isLoading"
    >
      <svg
        v-if="isLoading"
        class="animate-spin h-5 w-5 mr-2 text-black"
        xmlns="http://www.w3.org/2000/svg"
        fill="none"
        viewBox="0 0 24 24"
      >
        <circle
          class="opacity-25"
          cx="12"
          cy="12"
          r="10"
          stroke="currentColor"
          stroke-width="4"
        ></circle>
        <path
          class="opacity-75"
          fill="currentColor"
          d="M4 12a8 8 0 018-8v4a4 4 0 00-4 4H4z"
        ></path>
      </svg>
      <span>{{ isLoading ? "Registering..." : "Register" }}</span>
    </button>

    <!-- Backend Error / Success -->
    <p v-if="backendError" class="text-red-500 mt-2 text-center">
      {{ backendError }}
    </p>
    <p v-if="successMessage" class="text-green-500 mt-2 text-center">
      {{ successMessage }}
    </p>
  </form>
</template>

<script lang="ts" setup>
import type { PropType } from "vue";

interface RegisterForm {
  displayName: string;
  email: string;
  password: string;
  confirmPassword: string;
}

const props = defineProps({
  form: {
    type: Object as PropType<RegisterForm>,
    required: true,
  },
  errors: {
    type: Object as PropType<{
      email: string;
      password: string;
      confirmPassword: string;
    }>,
    required: true,
  },
  backendError: String,
  successMessage: String,
  isLoading: Boolean,
});

const emit = defineEmits<{
  (e: "submit"): void;
}>();
</script>
