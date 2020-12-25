import * as admin from 'firebase-admin';
admin.initializeApp();

export { onStoreUpdate } from './storage';
export { onStoreDelete } from './storage';