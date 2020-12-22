import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';

import * as Storage from '@google-cloud/storage';
import * as fs from 'fs-extra';

const gcs = Storage.Storage