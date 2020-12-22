import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';

export const onStoreUpdate = functions.firestore
  .document(`/stores/{storeId}`)
  .onUpdate(async (change, context) => {
    const before = change.before.data();
    const after = change.after.data();
    const storeId = context.params.storeId;

    if (before[`bannerUrl`] != after[`bannerUrl`]) {
      const url: string = before['bannerUrl'];
      const imgId = url.split(`img_`).pop()!.split(`?`)[0];
      const bucket = admin.storage().bucket();
      const path = `stores/store_${storeId}/banner/img_${imgId}`;
      console.log(path)
      await bucket.file(path).delete();
    }

  })