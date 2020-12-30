import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';

const storeCollection = functions.firestore.document(`/stores/{storeId}`);
const bucket = admin.storage().bucket();
const bannerStr: string = 'banner';
const picsStr: string = 'pics';

function getBannerStoragePath(storeId: string, imgId: string) {
  return `stores/store_${storeId}/banner/img_${imgId}`;
}
function getPicStoragePath(storeId: string, imgId: string) {
  return `stores/store_${storeId}/pics/img_${imgId}`;
}
function getIdFromUrl(url: string): string {
  return url.split(`img_`).pop()!.split(`?`)[0];
}
async function delteStorageFile(path: string): Promise<any> {
  return bucket.file(path).delete();
}

export const onStoreUpdate = storeCollection
  .onUpdate(async (change, context) => {
    const storeId = context.params.storeId;
    const before = change.before.data();
    const after = change.after.data();
    if (before == after) return;

    // clean the banner in storage
    const prevBanner: string = before[picsStr];
    const banner: string = after[bannerStr];
    if (banner == null) return;
    if (prevBanner != banner) {
      const imgId = getIdFromUrl(prevBanner);
      const path = getBannerStoragePath(storeId, imgId);
      await delteStorageFile(path);
    }

    // clean the pics in storagee
    const prevList: Array<string> = before['pics'];
    const newList: Array<string> = after['pics'];
    if (newList == null) return;
    if (newList != prevList) {
      for (let url of prevList) {
        if (!newList.includes(url)) {
          const imgId = getIdFromUrl(url);
          const path = getPicStoragePath(storeId, imgId);
          await delteStorageFile(path);
        }
      }
    }

  })

export const onStoreDelete = storeCollection.onDelete(
  async (snap, context) => {
    const storeId = context.params.storeId;

    // clear banner
    const banner: string = snap.data()[bannerStr];
    const bannerId = getIdFromUrl(banner);
    const bannerPath = getBannerStoragePath(storeId, bannerId);
    await delteStorageFile(bannerPath);

    // clear pics
    const pics: Array<string> = snap.data()[picsStr];
    for (let pic of pics) {
      const picId = getIdFromUrl(pic);
      const picPath = getPicStoragePath(storeId, picId);
      await delteStorageFile(picPath);
    }



  }
);