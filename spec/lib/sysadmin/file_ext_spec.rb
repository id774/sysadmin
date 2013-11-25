# -*- coding: utf-8 -*-

require File.dirname(__FILE__) + '/../../spec_helper'
require 'tempfile'
require 'zlib'

describe File do
  describe '#zread' do
    context 'read uncompressed file' do
      subject {
        @uncompressed = Tempfile::new("test.txt")
        File.append_line(:file => @uncompressed.path, :str => try)
        File.zread(@uncompressed.path)
      }

      let(:try) { "uncompressed" }
      let(:expected) { "uncompressed\n" }

      it 'should read successful' do
        expect(subject).to eq expected
        @uncompressed.close
      end
    end

    context 'read compressed file' do
      subject {
        @compressed = Tempfile::new("test2.txt")
        Zlib::GzipWriter.open(@compressed.path) do |gz|
          gz.puts try
        end
        File.zread(@compressed.path)
      }

      let(:try) { "compressed" }
      let(:expected) { "compressed\n" }

      it 'should read successful' do
        expect(subject).to eq expected
        @compressed.close
      end
    end
  end

  describe '#append_line' do
    context 'with arguments file and strings' do

      subject {
        @testfile = Tempfile::new("test.txt")
        3.times do
          File.append_line(:file => @testfile.path, :str => src)
        end
      }

      let(:src) { 'hoge' }
      let(:expected) { "hoge\n" }

      it 'should append strings to last line of file' do
        subject

        open(@testfile.path) { |file|
          while line = file.gets
            expect(line).to eq expected
          end
        }
        @testfile.close
      end
    end
  end

  describe '#replace_line' do
    context 'with arguments file and strings' do

      subject {
        @testfile = Tempfile::new("test.txt")
        3.times do
          File.append_line(:file => @testfile.path, :str => src)
        end
        File.replace_line(:file => @testfile.path, :src => src, :dst => try)
      }

      let(:src) { 'hoge' }
      let(:try) { 'fuga' }
      let(:expected) { "fuga\n" }

      it 'should replace line in file' do
        subject

        open(@testfile.path) { |file|
          while line = file.gets
            expect(line).to eq expected
          end
        }
        @testfile.close
      end
    end
  end

  describe '#remove_line' do
    context 'with arguments file and strings' do

      subject {
        @testfile = Tempfile::new("test.txt")
        3.times do
          File.append_line(:file => @testfile.path, :str => src)
        end
        File.replace_line(:file => @testfile.path, :src => src, :dst => replace)
        2.times do
          File.append_line(:file => @testfile.path, :str => src)
        end
        File.remove_line(:file => @testfile.path, :str => erase)
      }

      let(:src) { 'hoge' }
      let(:replace) { 'fuga' }
      let(:erase) { 'hoge' }
      let(:expected) { "fuga\n" }

      it 'should remove line from file' do
        subject

        open(@testfile.path) { |file|
          while line = file.gets
            expect(line).to eq expected
          end
        }
        @testfile.close
      end
    end
  end

  describe '#new_line' do
    context 'with arguments file and strings' do

      subject {
        @testfile = Tempfile::new("test.txt")
        File.new_line(:file => @testfile.path, :str => init)
        File.new_line(:file => @testfile.path, :str => second)
      }

      let(:init) { 'init' }
      let(:second) { 'second' }
      let(:expect) { "second\n" }

      it 'should create file of string lines' do
        subject

        open(@testfile.path) { |file|
          while line = file.gets
            line.should == expect
          end
        }
        @testfile.close
      end
    end
  end
end
