import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';

export const onStoreUpdate = functions.firestore
  .document(`/stores/{storeId}`)
  .onUpdate(async (change, context) => {
    const storeId = context.params.storeId;
    const before = change.before.data();
    const after = change.after.data();
    if (before == after) return;
    const bucket = admin.storage().bucket();

    if (before[`bannerUrl`] != after[`bannerUrl`]) {
      const url: string = before['bannerUrl'];
      const imgId = url.split(`img_`).pop()!.split(`?`)[0];
      const path = `stores/store_${storeId}/banner/img_${imgId}`;
      await bucket.file(path).delete();
    }

    const prevList: Array<string> = before['picUrls'];
    const newList: Array<string> = after['picUrls'];
    if (newList != prevList) {
      for (let url of prevList) {
        if (!newList.includes(url)) {
          const imgId = url.split(`img_`).pop()!.split(`?`)[0];
          const path = `stores/store_${storeId}/pics/img_${imgId}`;
          await bucket.file(path).delete();
        }
      }
    }

  })