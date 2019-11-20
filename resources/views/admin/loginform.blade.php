
                    <form method="POST" action="">
                        @csrf


                                <input id="username" type="text"   name="username" value="" required   autofocus>


                        @if ($errors->has('name'))
                            <span class="help-block">
                                        <strong>{{ $errors->first('name') }}</strong>
                                    </span>
                        @endif

                                <input id="password" type="password"   name="password" required  >


                                <button type="submit"  >
                                 提交
                                </button>

                        @if (session('error'))
                            <div class="alert alert-success">
                                {{ session('error') }}
                            </div>
                        @endif

                    </form>
