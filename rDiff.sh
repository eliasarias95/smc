#!/bin/sh

OLD_DOCS=javadoc
NEW_DOCS=build/doc/api

#diff --brief --ignore-matching-lines 'Generated by javadoc' $OLD_DOCS $NEW_DOCS | grep Files > diff.txt
diff --brief $OLD_DOCS $NEW_DOCS | grep differ > diff.txt
cat diff.txt | while read something
do
#  echo $something
  OLD_FILE=`echo $something | awk '{print $2}'`
  NEW_FILE=`echo $something | awk '{print $4}'`
  echo "OLD_FILE=$OLD_FILE, NEW_FILE=$NEW_FILE"
  cp $NEW_FILE $OLD_FILE
  echo "Updated file $OLD_FILE" >> edits.txt
done

rm diff.txt
cat edits.txt