<script setup>
import { useSnackStore } from '@/stores/SnackBar'
import { storeToRefs } from 'pinia'
const store = useSnackStore()
const { visible, text } = storeToRefs(store)
</script>

<template>
    <v-snackbar
        v-model="visible"
    >
        {{ text }}
        <template v-slot:actions>
            <v-btn
                color="pink"
                variant="text"
                @click="visible = false"
            >
                OK
            </v-btn>
        </template>
    </v-snackbar>
</template>