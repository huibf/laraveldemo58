
                    <form method="POST" action="{{url('/admin/store')}}">
                        @csrf

                        <select class="" name="tag">
                            <option value="">请选择标签</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                        </select>

                        @if ($errors->has('tag'))
                            <span class="help-block">
                                        <strong>{{ $errors->first('tag') }}</strong>
                                    </span>
                        @endif
                        <br>


                             姓名：   <input id="name" type="text"   name="name" value=""  ><br>


                        @if ($errors->has('name'))
                            <span class=" ">
                                        <strong>{{ $errors->first('name') }}</strong>
                                    </span>
                        @endif
                        <br>
                             年龄：   <input id="age" type="text"   name="age"   value=""   ><br>

                        @if ($errors->has('age'))
                            <span class=" ">
                                        <strong>{{ $errors->first('age') }}</strong>
                                    </span>
                        @endif
                        <br>
                                <button type="submit"  >
                                 提交
                                </button>
  <br>
                        @if (session('error'))
                            <div class="alert alert-success">
                            全部错误：    {{ session('error') }}
                            </div>
                        @endif

                    </form>
