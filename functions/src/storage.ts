import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';

export const onStoreUpdate = functions.firestore
  .document(`/stores/{storeId}`)
  .onUpdate(async (change, context) => {
    const storeId = context.params.storeId;
    const bucket = admin.storage().bucket();
    const before = change.before.data();
    const after = change.after.data();
    if (before == after) return;

    // clean the banner in storage
    if (before[`bannerUrl`] != after[`bannerUrl`]) {
      const imgId = getIdFromUrl(before['bannerUrl']);
      const path = `stores/store_${storeId}/banner/img_${imgId}`;
      await bucket.file(path).delete();
    }

    // clean the pics in storage
    const prevList: Array<string> = before['picUrls'];
    const newList: Array<string> = after['picUrls'];
    if (newList != prevList) {
      for (let url of prevList) {
        if (!newList.includes(url)) {
          const imgId = getIdFromUrl(url);
          const path = `stores/store_${storeId}/pics/img_${imgId}`;
          await bucket.file(path).delete();
        }
      }
    }
    
    function getIdFromUrl(url : string) : string {
      return url.split(`img_`).pop()!.split(`?`)[0];
    }

  })